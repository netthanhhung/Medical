﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Medical.Apartment.Data;
using Medical.Apartment.Common;
using System.Security.Cryptography;

namespace Medical.Apartment.Business
{
    public static class ApartmentMethods
    {
        #region Common
        /// <summary>
        /// Calls the data layer to save the record object.
        /// The record's RecordId is used to determine if the save operation is an insert or an update.
        /// </summary>
        /// <param name="record">The record object containing the data to be saved.</param>
        public static void SaveRecord(Record record)
        {
            new DataLayer().SaveRecord(record, (record.NullableRecordId == null) ? record.CreatedBy : record.UpdatedBy);
        }       

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Delete)]
        public static void DeleteRecord(Record record)
        {
            DataLayer dl = new DataLayer();
            String type = record.GetType().ToString();
            dl.DeleteRecord(Utilities.ToLong(record.RecordId), type.Substring(type.LastIndexOf(".") + 1, (type.Length - (type.LastIndexOf(".") + 1))));
        }

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Delete)]
        public static void DeleteRecord(long id, Type recordType)
        {
            DataLayer temp = new DataLayer();
            String type = recordType.ToString();
            temp.DeleteRecord(id, type.Substring(type.LastIndexOf(".") + 1, (type.Length - (type.LastIndexOf(".") + 1))));
        }
       
        #endregion

        #region Organisation
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists"),
        System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select)]
        public static List<Organisation> ListOrganisation(Guid? roleId)
        {
            DataLayer dataLayer = new DataLayer();
            List<Organisation> result = dataLayer.ListOrganisation();
            if (roleId.HasValue)
            {
                foreach (Organisation org in result)
                {
                    org.ContactInformation = dataLayer.ListContactInformation(org.ContactInformationId).FirstOrDefault();
                    org.OrgAdminUsers = dataLayer.ListUserRoleAuth(org.OrganisationId, null, roleId.Value);
                }
            }
            return result;
        }

        public static List<AspUser> ListOrgAdminAspUser(int orgId, Guid roleId)
        {
            DataLayer dataLayer = new DataLayer();
            List<AspUser> result = new List<AspUser>();
            List<UserRoleAuth> uraList = dataLayer.ListUserRoleAuth(orgId, null, roleId);
            if (uraList != null)
            {
                foreach (UserRoleAuth ura in uraList)
                {
                    result.AddRange(dataLayer.ListAspUser(orgId, ura.UserId, null));
                }
                result = result.OrderByDescending(i => i.LastActivityDate).ToList();
            }
            return result;
        }

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Update)]
        public static void SaveOrganisations(List<Organisation> saveList)
        {
            if (saveList != null)
            {
                foreach (Organisation item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        if (item.ContactInformation != null)
                        {
                            SaveRecord(item.ContactInformation);
                            if (item.ContactInformation.NullableRecordId.HasValue
                                && item.ContactInformationId != Convert.ToInt32(item.ContactInformation.RecordId.Value))
                            {
                                item.ContactInformationId = Convert.ToInt32(item.ContactInformation.RecordId.Value);
                            }
                        }
                        SaveRecord(item);
                    }
                }
            }
        }

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select)]
        public static Organisation GetOrganisation(int organisationId)
        {
            return new DataLayer().GetOrganisation(organisationId);
        }

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select)]
        public static Organisation GetOrganisation(string authorisationCode)
        {
            return new DataLayer().GetOrganisation(authorisationCode);
        }

        public static int? GetOrganisationIdForEmployee(Guid userId)
        {
            return new DataLayer().GetOrganisationIdForEmployee(userId);
        }
        #endregion

        #region Sites
        public static List<Site> ListSite(int? orgId, int? siteId, bool showLegacy, bool loadContact)
        {
            DataLayer dataLayer = new DataLayer();
            List<Site> result = dataLayer.ListSite(orgId, siteId, showLegacy);
            if (loadContact)
            {
                foreach (Site site in result)
                {
                    if (site.ContactInformationID > 0)
                    {
                        List<ContactInformation> contacts = dataLayer.ListContactInformation(site.ContactInformationID);
                        if (contacts.Count > 0)
                        {
                            site.ContactInformation = contacts[0];
                        }
                    }
                }
            }
            return result;
        }

        public static void SaveSite(List<Site> saveList)
        {
            if (saveList != null)
            {
                foreach (Site item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        if (item.ContactInformation != null)
                        {
                            SaveRecord(item.ContactInformation);
                            if (item.ContactInformation.NullableRecordId.HasValue
                                && item.ContactInformationID != Convert.ToInt32(item.ContactInformation.RecordId.Value))
                            {
                                item.ContactInformationID = Convert.ToInt32(item.ContactInformation.RecordId.Value);
                            }
                        }
                        SaveRecord(item);
                    }
                }
            }
        }
        #endregion

        #region UserAccount
        public static List<AspUser> ListAspUser(int? orgId, Guid? userId, bool? isLegacy)
        {
            return new DataLayer().ListAspUser(orgId, userId, isLegacy);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static List<string> ListUserName(string applicationName, int? orgId, string startsWith)
        {
            return new DataLayer().ListUserName(applicationName, orgId, startsWith);
        }

        public static int? UpdateMembershipUserName(string applicationName, string userName, string newUserName)
        {
            return new DataLayer().UpdateMemberhipUserName(applicationName, userName, newUserName);
        }

        public static void UpdateAspUserOrganisationId(Guid userId, int? organisationId)
        {
            new DataLayer().UpdateAspUserOrganisationId(userId, organisationId);
        }
        #endregion

        #region Security
        public static List<Component> ListComponent(int? componentId)
        {
            return new DataLayer().ListComponent(componentId);
        }

        public static List<RoleComponentPermission> ListRoleComponentPermission(Guid? roleId, int? componentId)
        {
            return new DataLayer().ListRoleComponentPermission(roleId, componentId);
        }

        public static List<RoleComponentPermission> ListRoleComponentPermissionByUser(Guid? userId)
        {
            return new DataLayer().ListRoleComponentPermissionByUser(userId);
        }

        public static void SaveRoleComponentPermission(List<RoleComponentPermission> saveList)
        {
            if (saveList != null)
            {
                foreach (RoleComponentPermission item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }


        public static List<AspRole> ListAspRole(Guid? roleId)
        {
            return new DataLayer().ListAspRole(roleId);
        }

        public static void SaveAspRole(string applicationName, List<AspRole> saveList, string currentUser)
        {
            if (saveList != null)
            {
                DataLayer dataLayer = new DataLayer();
                foreach (AspRole item in saveList)
                {
                    if (item.IsDeleted && item.RoleId != Guid.Empty && item.CanDelete)
                    {
                        dataLayer.DeleteAspRole(item);
                    }
                    else if (item.IsChanged)
                    {
                        if (!string.IsNullOrEmpty(item.RoleName))
                            item.LoweredRoleName = item.RoleName.ToLower();
                        else
                            item.LoweredRoleName = item.RoleName = string.Empty;
                        dataLayer.SaveAspRole(applicationName, item, currentUser);
                    }
                }
            }
        }

        public static List<UserRoleAuth> ListUserRoleAuth(int? orgId, Guid? userId, Guid? roleId)
        {
            return new DataLayer().ListUserRoleAuth(orgId, userId, roleId);
        }

        public static void SaveUserRoleAuth(List<UserRoleAuth> saveList)
        {
            if (saveList != null)
            {
                foreach (UserRoleAuth item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion

        #region Contact Information
        public static List<Country> ListCountry(int? countryId)
        {
            return new DataLayer().ListCountry(countryId);
        }

        public static List<City> ListCity(int? countryid, int? cityId)
        {
            return new DataLayer().ListCity(countryid, cityId);
        }

        public static List<District> ListDistrict(int? cityId, int? districtId)
        {
            return new DataLayer().ListDistrict(cityId, districtId);
        }

        public static List<ContactInformation> ListContactInformation(int? contactInfoId)
        {            
            return new DataLayer().ListContactInformation(contactInfoId);
        }

        public static void SaveContactInformation(List<ContactInformation> saveList)
        {
            if (saveList != null)
            {
                foreach (ContactInformation item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion

        #region Customer
        public static List<Customer> ListCustomer(int? orgId, int? siteId, int? customerId, string firstName, string lastName,
            bool hasContracts, DateTime? contractDateStart, DateTime? contractDateEnd, bool includeLegacy)
        {
            DataLayer dl = new DataLayer();
            List<Customer> result = dl.ListCustomer(orgId, siteId, customerId, firstName, lastName, hasContracts, contractDateStart, contractDateEnd, includeLegacy);
            if (result != null)
            {
                foreach (Customer cus in result)
                {
                    cus.ContactInformation = dl.ListContactInformation(cus.ContactInformationId).FirstOrDefault();
                    
                }
            }
            return result;
        }

        public static List<Customer> SaveCustomer(List<Customer> saveList)
        {
            if (saveList != null)
            {
                foreach (Customer item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        if (item.ContactInformation != null)
                        {
                            DeleteRecord((Record)item.ContactInformation);
                        }
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged || (item.ContactInformation != null && item.ContactInformation.IsChanged))
                    {
                        if (item.ContactInformation != null && item.ContactInformation.IsChanged)
                        {
                            SaveRecord((Record)item.ContactInformation);
                            item.ContactInformationId = item.ContactInformation.ContactInformationId;
                        }
                        SaveRecord((Record)item);
                    }
                }
            }
            return saveList;
        }
        #endregion

        #region Doctor
        public static List<Doctor> ListDoctor(int? orgId, int? siteId, int? doctorId, string firstName, string lastName, bool includeLegacy)
        {
            DataLayer dl = new DataLayer();
            List<Doctor> result = dl.ListDoctor(orgId, siteId, doctorId, firstName, lastName, includeLegacy);
            if (result != null)
            {
                foreach (Doctor cus in result)
                {
                    cus.ContactInformation = dl.ListContactInformation(cus.ContactInformationId).FirstOrDefault();

                }
            }
            return result;
        }

        public static List<Doctor> SaveDoctor(List<Doctor> saveList)
        {
            if (saveList != null)
            {
                foreach (Doctor item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        if (item.ContactInformation != null)
                        {
                            DeleteRecord((Record)item.ContactInformation);
                        }
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged || (item.ContactInformation != null && item.ContactInformation.IsChanged))
                    {
                        if (item.ContactInformation != null && item.ContactInformation.IsChanged)
                        {
                            SaveRecord((Record)item.ContactInformation);
                            item.ContactInformationId = item.ContactInformation.ContactInformationId;
                        }
                        SaveRecord((Record)item);
                    }
                }
            }
            return saveList;
        }
        #endregion

        #region Encrypt/Decrypt        
        /// <summary>
        /// Encrypt the given string using the specified key.
        /// </summary>
        /// <param name="strToEncrypt">The string to be encrypted.</param>
        /// <param name="strKey">The encryption key.</param>
        /// <returns>The encrypted string.</returns>
        public static string Encrypt(string strToEncrypt, string strKey)
        {
            try
            {
                TripleDESCryptoServiceProvider objDESCrypto =
                    new TripleDESCryptoServiceProvider();
                MD5CryptoServiceProvider objHashMD5 = new MD5CryptoServiceProvider();
                byte[] byteHash, byteBuff;
                string strTempKey = strKey;
                byteHash = objHashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(strTempKey));
                objHashMD5 = null;
                objDESCrypto.Key = byteHash;
                objDESCrypto.Mode = CipherMode.ECB; //CBC, CFB
                byteBuff = ASCIIEncoding.ASCII.GetBytes(strToEncrypt);
                return Convert.ToBase64String(objDESCrypto.CreateEncryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
            }
            catch (Exception ex)
            {
                return "Wrong Input. " + ex.Message;
            }
        }

        /// <summary>
        /// Decrypt the given string using the specified key.
        /// </summary>
        /// <param name="strEncrypted">The string to be decrypted.</param>
        /// <param name="strKey">The decryption key.</param>
        /// <returns>The decrypted string.</returns>
        public static string Decrypt(string strEncrypted, string strKey)
        {
            try
            {
                TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider();
                MD5CryptoServiceProvider objHashMD5 = new MD5CryptoServiceProvider();
                byte[] byteHash, byteBuff;
                string strTempKey = strKey;
                byteHash = objHashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(strTempKey));
                objHashMD5 = null;
                objDESCrypto.Key = byteHash;
                objDESCrypto.Mode = CipherMode.ECB; //CBC, CFB
                byteBuff = Convert.FromBase64String(strEncrypted);
                string strDecrypted = ASCIIEncoding.ASCII.GetString(
                    objDESCrypto.CreateDecryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
                objDESCrypto = null;
                return strDecrypted;
            }
            catch (Exception ex)
            {
                return "Wrong Input. " + ex.Message;
            }
        }

        #endregion

        #region Tag Version
        public static TagVersion GetLatestTagVersion()
        {
            return new DataLayer().GetLatestTagVersion();
        }
        #endregion

        #region Medicine
        public static List<Medicine> ListMedicine(int? organisationId, int? medicineId, bool showLegacy)
        {
            return new DataLayer().ListMedicine(organisationId, medicineId, showLegacy);
        }

        public static void SaveMedicine(List<Medicine> saveList)
        {
            if (saveList != null)
            {
                foreach (Medicine item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }

        public static List<Medicine> ListSiteMedicineStatus(int siteId, int? medicineId, DateTime dateFrom, DateTime dateTo, bool showLegacy)
        {
            return new DataLayer().ListSiteMedicineStatus(siteId, medicineId, dateFrom, dateTo, showLegacy);
        }
        #endregion

        #region MedicineInput
        public static List<MedicineInput> ListMedicineInput(int siteId, int? medicineId, DateTime dateFrom, DateTime dateTo)
        {
            return new DataLayer().ListMedicineInput(siteId, medicineId, dateFrom, dateTo);
        }

        public static void SaveMedicineInput(List<MedicineInput> saveList)
        {
            if (saveList != null)
            {
                foreach (MedicineInput item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion

        #region Service
        public static List<Service> ListService(int? organisationId, int? serviceId, bool showLegacy)
        {
            return new DataLayer().ListService(organisationId, serviceId, showLegacy);
        }

        public static void SaveService(List<Service> saveList)
        {
            if (saveList != null)
            {
                foreach (Service item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion

        #region Image
        public static List<Image> ListImage(int? imageId, int? itemId, int? imageTypeId, int loadType)
        {
            return new DataLayer().ListImage(imageId, itemId, imageTypeId, loadType);
        }

        public static void SaveImage(List<Image> saveList)
        {
            if (saveList != null)
            {
                foreach (Image item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion

        #region Treatment
        public static List<Treatment> ListTreatment(int orgId, int? siteId, int? customerId, int? doctorId, int? treatmentId, DateTime? dateStart, DateTime? dateEnd)
        {
            return new DataLayer().ListTreatment(orgId, siteId, customerId, doctorId, treatmentId, dateStart, dateEnd);
        }

        public static void SaveTreatment(List<Treatment> saveList)
        {
            if (saveList != null)
            {
                foreach (Treatment item in saveList)
                {
                    if (item.IsChanged)
                    {                        
                        SaveRecord((Record)item);

                    }
                }
            }
        }
        #endregion

        #region TreatmentMedicine
        public static List<TreatmentMedicine> ListTreatmentMedicine(int? treatmentMedicineId, int? treatmnentId)
        {
            return new DataLayer().ListTreatmentMedicine(treatmentMedicineId, treatmnentId);
        }

        public static void SaveTreatmentMedicine(List<TreatmentMedicine> saveList)
        {
            if (saveList != null)
            {
                foreach (TreatmentMedicine item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion

        #region TreatmentService
        public static List<TreatmentService> ListTreatmentService(int? treatmentServiceId, int? treatmnentId)
        {
            return new DataLayer().ListTreatmentService(treatmentServiceId, treatmnentId);
        }

        public static void SaveTreatmentService(List<TreatmentService> saveList)
        {
            if (saveList != null)
            {
                foreach (TreatmentService item in saveList)
                {
                    if (item.IsDeleted && item.NullableRecordId != null)
                    {
                        DeleteRecord((Record)item);
                    }
                    else if (item.IsChanged)
                    {
                        SaveRecord((Record)item);
                    }
                }
            }
        }
        #endregion
    }
}

