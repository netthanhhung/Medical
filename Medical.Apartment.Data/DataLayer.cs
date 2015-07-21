using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.SqlClient;
using Medical.Apartment.Common;
using System.Data;
using System.Data.Common;

namespace Medical.Apartment.Data
{
    public sealed partial class DataLayer
    {
        #region Private Attributes
        private Database _db;
        private const int _extendedTimeout = 5400;

        #endregion

        #region Public Constructors
        public DataLayer()
        {
            //_db = DatabaseFactory.CreateDatabase();
            _db = EnterpriseLibraryContainer.Current.GetInstance<Database>("Medical");
        }
        #endregion

        #region Common
        private void AddParameters(System.Data.Common.DbCommand command, SqlParameter[] sqlParams)
        {
            foreach (SqlParameter param in sqlParams)
            {
                _db.AddParameter(command, param.ParameterName, param.DbType, param.Size, param.Direction, param.IsNullable, param.Precision, param.Scale, param.SourceColumn, param.SourceVersion, param.Value);
            }
        }

        public void SaveRecord(Record record)
        {
            SqlParameter[] sqlParams = record.SqlParameters();
            System.Data.Common.DbCommand cmd = _db.GetStoredProcCommand("procSave" + record.TypeName);
            AddParameters(cmd, sqlParams);
            record.Concurrency = Utilities.ToByteArray(_db.ExecuteScalar(cmd));
            record.RecordId = (long)_db.GetParameterValue(cmd, record.TypeName + "ID");
        }

        public void SaveRecord(Record record, string currentUser)
        {
            SqlParameter[] sqlParams = record.SqlParameters();
            System.Data.Common.DbCommand cmd = _db.GetStoredProcCommand("procSave" + record.TypeName);
            AddParameters(cmd, sqlParams);
            AddParameters(cmd, new SqlParameter[] { new SqlParameter("CurrentUser", currentUser) });
            record.Concurrency = Utilities.ToByteArray(_db.ExecuteScalar(cmd));
            record.RecordId = (long)_db.GetParameterValue(cmd, record.TypeName + "ID");
        }

        public void SaveRecord(Record record, string currentUser, string procName)
        {
            SqlParameter[] sqlParams = record.SqlParameters();
            System.Data.Common.DbCommand cmd = _db.GetStoredProcCommand(procName);
            AddParameters(cmd, sqlParams);
            AddParameters(cmd, new SqlParameter[] { new SqlParameter("CurrentUser", currentUser) });
            record.Concurrency = Utilities.ToByteArray(_db.ExecuteScalar(cmd));
            record.RecordId = (long)_db.GetParameterValue(cmd, record.TypeName + "ID");
        }

        public void SaveRecordExtended(Record record, string procName)
        {
            SqlParameter[] sqlParams = record.SqlParameters();
            System.Data.Common.DbCommand cmd = _db.GetStoredProcCommand(procName);
            AddParameters(cmd, sqlParams);
            _db.ExecuteScalar(cmd);
        }
        
        private DbCommand GetDbCommandWithExtendedTimeout(string storedProcedureName, params object[] parameterValues)
        {
            DbCommand result = this._db.GetStoredProcCommand(storedProcedureName, parameterValues);
            result.CommandTimeout = _extendedTimeout;

            return result;
        }

        private int ExecuteNonQueryWithExtendedTimeout(string storedProcedureName, params object[] parameterValues)
        {
            int result = 0;

            using (DbCommand cmd = this._db.GetStoredProcCommand(storedProcedureName, parameterValues))
            {
                cmd.CommandTimeout = _extendedTimeout;
                result = _db.ExecuteNonQuery(cmd);
            }

            return result;
        }

        public void DeleteRecord(long recordId, string recordType)
        {
            string store = "procDelete" + recordType;
            _db.ExecuteNonQuery(store, recordId);
        }
        #endregion

        #region UserAccount
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<string> ListUserName(string applicationName, int? orgId, string startsWith)
        {
            List<string> result = new List<string>();

            using (IDataReader reader = _db.ExecuteReader("procListUserName", applicationName, orgId, startsWith))
            {
                result.Clear();

                while (true)
                {
                    string userName = null;

                    if (null != reader && reader.Read())
                    {
                        userName = Utilities.ToString(reader["UserName"]);
                    }

                    if (string.IsNullOrEmpty(userName))
                    {
                        break;
                    }

                    result.Add(userName);
                }
            }

            return result;
        }

        public int? UpdateMemberhipUserName(string applicationName, string userName, string newUserName)
        {
            int? result = null;

            SqlParameter[] sqlParams = new SqlParameter[]
			{ 
				Utilities.MakeInputParameter("ApplicationName", applicationName),
				Utilities.MakeInputParameter("UserName", userName),
				Utilities.MakeInputParameter("NewUserName", newUserName)
			};

            System.Data.Common.DbCommand cmd = _db.GetStoredProcCommand("aspnet_Membership_UpdateUserName_Custom");
            AddParameters(cmd, sqlParams);

            result = Utilities.ToNInt(_db.ExecuteScalar(cmd));

            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public void UpdateAspUserOrganisationId(Guid userId, int? organisationId)
        {
            _db.ExecuteNonQuery("procUpdateAspUserOrganisationId", userId, organisationId);
        }

        #endregion

        #region Security

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<UserRoleAuth> ListUserRoleAuth(int? orgId, Guid? userId, Guid? roleId)
        {
            List<UserRoleAuth> result = new List<UserRoleAuth>();

            using (IDataReader reader = _db.ExecuteReader("[procListUserRoleAuth]", orgId, userId, roleId))
            {
                Factory.FillUserRoleAuthList(result, reader);
            }
            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Component> ListComponent(int? componentId)
        {
            List<Component> result = new List<Component>();

            using (IDataReader reader = _db.ExecuteReader("procListComponent", componentId))
            {
                Factory.FillComponentList(result, reader);
            }
            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<RoleComponentPermission> ListRoleComponentPermission(Guid? roleId, int? componentId)
        {
            List<RoleComponentPermission> result = new List<RoleComponentPermission>();

            using (IDataReader reader = _db.ExecuteReader("procListRoleComponentPermission", roleId, componentId))
            {
                Factory.FillRoleComponentPermissionList(result, reader);
            }
            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<RoleComponentPermission> ListRoleComponentPermissionByUser(Guid? userId)
        {
            List<RoleComponentPermission> result = new List<RoleComponentPermission>();

            using (IDataReader reader = _db.ExecuteReader("procListRoleComponentPermissionByUser", userId))
            {
                Factory.FillRoleComponentPermissionList(result, reader);
            }
            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<AspRole> ListAspRole(Guid? roleId)
        {
            List<AspRole> result = new List<AspRole>();

            using (IDataReader reader = _db.ExecuteReader("procListAspRole", roleId))
            {
                Factory.FillAspRoleList(result, reader);
            }
            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public void SaveAspRole(string applicationName, AspRole saveItem, string currentUser)
        {
            _db.ExecuteNonQuery("procSaveAspRole", applicationName, saveItem.RoleId, saveItem.RoleName,
                saveItem.LoweredRoleName, saveItem.Description, currentUser);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public void DeleteAspRole(AspRole deleteItem)
        {
            _db.ExecuteNonQuery("procDeleteAspRole", deleteItem.RoleId);
        }


        #endregion

        #region Organisation

        /// <summary>
        /// Gets the specified Organisation record.
        /// </summary>
        /// <param name="recordId">The OrganisationId.</param>
        /// <returns>The Organisation object.</returns>
        public Organisation GetOrganisation(int recordId)
        {
            Organisation result = null;
            using (DbCommand cmd = this._db.GetStoredProcCommand("procGetOrganisation"))
            {
                AddParameters(cmd, new SqlParameter[] { new SqlParameter("OrganisationID", recordId) });
                using (IDataReader reader = this._db.ExecuteReader(cmd))
                {
                    result = Factory.PopulateOrganisation(reader);
                }
            }
            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="authorisationCode"></param>
        /// <returns></returns>
        public Organisation GetOrganisation(string authorisationCode)
        {
            Organisation result = null;

            using (IDataReader reader = _db.ExecuteReader("procGetOrganisationByAuthorisationCode", authorisationCode))
            {
                result = Factory.PopulateOrganisation(reader);
            }

            return result;
        }

        public int? GetOrganisationIdForEmployee(Guid userId)
        {
            int? result = null;

            result = _db.ExecuteScalar("procGetOrganisationIdForEmployee", userId) as int?;

            return result;
        }

        /// <summary>
        /// Lists the Organisation.
        /// </summary>
        /// <returns>The generic Organisation list.</returns>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Organisation> ListOrganisation()
        {
            List<Organisation> result = new List<Organisation>();
            using (IDataReader reader = this._db.ExecuteReader("procListOrganisation"))
            {
                Factory.PopulateOrganisationList(result, reader);
            }
            return result;
        }
        #endregion

        #region Sites
        /// <summary>
        /// Lists the Site.
        /// </summary>
        /// <returns>The generic Site list.</returns>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Site> ListSite(int? orgId, int? siteId, bool showLegacy)
        {
            List<Site> result = new List<Site>();
            using (IDataReader reader = this._db.ExecuteReader("procListSite", orgId, siteId, showLegacy))
            {
                Factory.PopulateSiteList(result, reader);
            }
            return result;
        }
        #endregion

        #region AspUser

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<AspUser> ListAspUser(int? orgId, Guid? userId, bool? isLegacy)
        {
            List<AspUser> result = new List<AspUser>();
            using (IDataReader reader = _db.ExecuteReader("procListAspUser", orgId, userId, isLegacy))
            {
                Factory.FillAspUserList(result, reader);
            }
            return result;
        }        
        #endregion        

        #region Country
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Country> ListCountry(int? countryId)
        {
            List<Country> result = new List<Country>();

            using (IDataReader reader = _db.ExecuteReader("procListCountry", countryId))
            {
                Factory.FillCountryList(result, reader);
            }

            return result;
        }
        #endregion

        #region City
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<City> ListCity(int? countryid, int? cityId)
        {
            List<City> result = new List<City>();

            using (IDataReader reader = _db.ExecuteReader("procListCity", countryid, cityId))
            {
                Factory.FillCityList(result, reader);
            }

            return result;
        }
        #endregion

        #region District
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<District> ListDistrict(int? cityId, int? districtId)
        {
            List<District> result = new List<District>();

            using (IDataReader reader = _db.ExecuteReader("procListDistrict", cityId, districtId))
            {
                Factory.FillDistrictList(result, reader);
            }

            return result;
        }
        #endregion

        #region ContactInformation
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<ContactInformation> ListContactInformation(int? contactInfoId)
        {
            List<ContactInformation> result = new List<ContactInformation>();

            using (IDataReader reader = _db.ExecuteReader("procListContactInformation", contactInfoId))
            {
                Factory.FillContactInformationList(result, reader);
            }

            return result;
        }
        #endregion

        #region Customer
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Customer> ListCustomer(int? orgId, int? siteId, int? customerId, string firstName, string lastName,
            bool hasContracts, DateTime? contractDateStart, DateTime? contractDateEnd, bool includeLegacy)
        {
            List<Customer> result = new List<Customer>();

            using (IDataReader reader = _db.ExecuteReader("procListCustomer", orgId, siteId, customerId, firstName, lastName, hasContracts, contractDateStart, contractDateEnd, includeLegacy))
            {
                Factory.FillCustomerList(result, reader);
            }

            return result;
        }
        #endregion

        #region Doctor
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Doctor> ListDoctor(int? orgId, int? siteId, int? doctorId, string firstName, string lastName, bool includeLegacy)
        {
            List<Doctor> result = new List<Doctor>();

            using (IDataReader reader = _db.ExecuteReader("procListDoctor", orgId, siteId, doctorId, firstName, lastName, includeLegacy))
            {
                Factory.FillDoctorList(result, reader);
            }

            return result;
        }
        #endregion

        #region TagVersion
        public TagVersion GetLatestTagVersion()
        {
            List<TagVersion> result = new List<TagVersion>();

            using (IDataReader reader = _db.ExecuteReader("procGetLatestTagVersion"))
            {
                Factory.PopulateTagVersionsList(result, reader);
            }

            if (result.Count > 0)
            {
                return result[0];
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region Medicine
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Medicine> ListMedicine(int? organisationId, int? medicineId, bool showLegacy)
        {
            List<Medicine> result = new List<Medicine>();

            using (IDataReader reader = _db.ExecuteReader("procListMedicine", organisationId, medicineId, showLegacy))
            {
                Factory.FillMedicineList(result, reader);
            }
            return result;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Medicine> ListSiteMedicineStatus(int siteId, int? medicineId, DateTime dateFrom, DateTime dateTo, bool showLegacy)
        {
            List<Medicine> result = new List<Medicine>();

            using (IDataReader reader = _db.ExecuteReader("procListSiteMedicineStatus", siteId, medicineId, dateFrom, dateTo, showLegacy))
            {
                Factory.FillMedicineList(result, reader);
            }
            return result;
        }

        #endregion

        #region MedicineInput
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<MedicineInput> ListMedicineInput(int siteId, int? medicineId, DateTime dateFrom, DateTime dateTo)
        {
            List<MedicineInput> result = new List<MedicineInput>();

            using (IDataReader reader = _db.ExecuteReader("procListMedicineInput", siteId, medicineId, dateFrom, dateTo))
            {
                Factory.FillMedicineInputList(result, reader);
            }
            return result;
        }
        #endregion

        #region Service
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Service> ListService(int? organisationId, int? serviceId, bool showLegacy)
        {
            List<Service> result = new List<Service>();

            using (IDataReader reader = _db.ExecuteReader("procListService", organisationId, serviceId, showLegacy))
            {
                Factory.FillServiceList(result, reader);
            }
            return result;
        }
        #endregion

        #region Image
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Image> ListImage(int? imageId, int? itemId, int? imageTypeId, int loadType)
        {
            List<Image> result = new List<Image>();

            using (IDataReader reader = _db.ExecuteReader("procListImage", imageId, itemId, imageTypeId, loadType))
            {
                Factory.FillImageList(result, reader);
            }
            return result;
        }
        #endregion

        #region Treatment
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<Treatment> ListTreatment(int orgId, int? siteId, int? customerId, int? doctorId, int? treatmentId, DateTime? dateStart, DateTime? dateEnd)
        {
            List<Treatment> result = new List<Treatment>();

            using (IDataReader reader = _db.ExecuteReader("procListTreatment", orgId, siteId, customerId, doctorId, treatmentId, dateStart, dateEnd))
            {
                Factory.FillTreatmentList(result, reader);
            }
            return result;
        }
        #endregion
        
        #region TreatmentMedicine
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<TreatmentMedicine> ListTreatmentMedicine(int? treatmentMedicineId, int? treatmnentId)
        {
            List<TreatmentMedicine> result = new List<TreatmentMedicine>();

            using (IDataReader reader = _db.ExecuteReader("procListTreatmentMedicine", treatmentMedicineId, treatmnentId))
            {
                Factory.FillTreatmentMedicineList(result, reader);
            }
            return result;
        }
        #endregion

        #region TreatmentService
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public List<TreatmentService> ListTreatmentService(int? treatmentServiceId, int? treatmnentId)
        {
            List<TreatmentService> result = new List<TreatmentService>();

            using (IDataReader reader = _db.ExecuteReader("procListTreatmentService", treatmentServiceId, treatmnentId))
            {
                Factory.FillTreatmentServiceList(result, reader);
            }
            return result;
        }
        #endregion
       
    }
}
