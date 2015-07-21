using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Medical.Apartment.Common
{
    public static partial class Factory
    {
        private static void PopulateRecord(Record record, System.Data.IDataReader reader)
        {
            record.Concurrency = Utilities.ToByteArray(reader["Concurrency"]);
            record.DateCreated = Utilities.ToNDateTime(reader["DateCreated"]);
            record.DateUpdated = Utilities.ToNDateTime(reader["DateUpdated"]);
            record.CreatedBy = Utilities.ToString(reader["CreatedBy"]);
            record.UpdatedBy = Utilities.ToString(reader["UpdatedBy"]);
        }

        #region UserRoleAuth

        public static UserRoleAuth UserRoleAuth(System.Data.IDataReader reader)
        {
            UserRoleAuth result = null;

            if (null != reader && reader.Read())
            {
                result = new UserRoleAuth();
                PopulateUserRoleAuth(result, reader);
            }

            return result;
        }

        public static void PopulateUserRoleAuth(UserRoleAuth input, System.Data.IDataReader reader)
        {
            input.RecordId = input.UserRoleAuthId = Utilities.ToInt(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNames.UserRoleAuthId]);
            input.UserId = Utilities.ToGuid(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNames.UserId]);
            input.RoleId = Utilities.ToGuid(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNames.RoleId]);
            input.WholeOrg = Utilities.ToNBool(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNames.WholeOrg]);
            input.SiteId = Utilities.ToNInt(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNames.SiteId]);            
            input.UserName = Utilities.ToString(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNamesExtended.UserName]);            
            input.RoleName = Utilities.ToString(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNamesExtended.RoleName]);
            input.Site = Utilities.ToString(reader[Medical.Apartment.Common.UserRoleAuth.ColumnNamesExtended.Site]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillUserRoleAuthList(List<UserRoleAuth> list, System.Data.IDataReader reader)
        {
            list.Clear();
            UserRoleAuth item;
            while (true)
            {
                item = Factory.UserRoleAuth(reader);
                if (null == item) break;
                list.Add(item);
            }
        }

        #endregion

        #region Component

        public static Component Component(System.Data.IDataReader reader)
        {
            Component result = null;

            if (null != reader && reader.Read())
            {
                result = new Component();
                PopulateComponent(result, reader);
            }

            return result;
        }

        public static void PopulateComponent(Component input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.ComponentId = Utilities.ToInt(reader[Medical.Apartment.Common.Component.ColumnNames.ComponentId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.Component.ColumnNames.Name]);

        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillComponentList(List<Component> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Component item;
            while (true)
            {
                item = Factory.Component(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region RoleComponentPermission

        public static RoleComponentPermission RoleComponentPermission(System.Data.IDataReader reader)
        {
            RoleComponentPermission result = null;

            if (null != reader && reader.Read())
            {
                result = new RoleComponentPermission();
                PopulateRoleComponentPermission(result, reader);
            }

            return result;
        }

        public static void PopulateRoleComponentPermission(RoleComponentPermission input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.RoleComponentPermissionId = Utilities.ToInt(reader[Medical.Apartment.Common.RoleComponentPermission.ColumnNames.RoleComponentPermissionId]);
            input.RoleId = Utilities.ToGuid(reader[Medical.Apartment.Common.RoleComponentPermission.ColumnNames.RoleId]);
            input.ComponentId = Utilities.ToInt(reader[Medical.Apartment.Common.RoleComponentPermission.ColumnNames.ComponentId]);
            input.WriteRight = Utilities.ToNBool(reader[Medical.Apartment.Common.RoleComponentPermission.ColumnNames.WriteRight]);
            input.RoleName = Utilities.ToString(reader[Medical.Apartment.Common.RoleComponentPermission.ColumnNamesExtended.RoleName]);
            input.ComponentName = Utilities.ToString(reader[Medical.Apartment.Common.RoleComponentPermission.ColumnNamesExtended.ComponentName]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillRoleComponentPermissionList(List<RoleComponentPermission> list, System.Data.IDataReader reader)
        {
            list.Clear();
            RoleComponentPermission item;
            while (true)
            {
                item = Factory.RoleComponentPermission(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region AspRole

        public static AspRole AspRole(System.Data.IDataReader reader)
        {
            AspRole result = null;

            if (null != reader && reader.Read())
            {
                result = new AspRole();
                PopulateAspRole(result, reader);
            }

            return result;
        }

        public static void PopulateAspRole(AspRole input, System.Data.IDataReader reader)
        {
            input.ApplicationId = Utilities.ToGuid(reader[Medical.Apartment.Common.AspRole.ColumnNames.ApplicationId]);
            input.RoleId = Utilities.ToGuid(reader[Medical.Apartment.Common.AspRole.ColumnNames.RoleId]);
            input.RoleName = Utilities.ToString(reader[Medical.Apartment.Common.AspRole.ColumnNames.RoleName]);
            input.LoweredRoleName = Utilities.ToString(reader[Medical.Apartment.Common.AspRole.ColumnNames.LoweredRoleName]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.AspRole.ColumnNames.Description]);
            input.CanDelete = Utilities.ToBool(reader[Medical.Apartment.Common.AspRole.ColumnNames.CanDelete]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillAspRoleList(List<AspRole> list, System.Data.IDataReader reader)
        {
            list.Clear();
            AspRole item;
            while (true)
            {
                item = Factory.AspRole(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region AspUser

        public static AspUser AspUser(System.Data.IDataReader reader)
        {
            AspUser result = null;

            if (null != reader && reader.Read())
            {
                result = new AspUser();
                PopulateAspUser(result, reader);
            }

            return result;
        }

        public static void PopulateAspUser(AspUser input, System.Data.IDataReader reader)
        {
            input.ApplicationId = Utilities.ToGuid(reader[Medical.Apartment.Common.AspUser.ColumnNames.ApplicationId]);
            input.UserId = Utilities.ToGuid(reader[Medical.Apartment.Common.AspUser.ColumnNames.UserId]);
            input.Password = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.Password]);
            input.PasswordFormat = Utilities.ToInt(reader[Medical.Apartment.Common.AspUser.ColumnNames.PasswordFormat]);
            input.PasswordSalt = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.PasswordSalt]);
            input.MobilePIN = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.MobilePIN]);
            input.Email = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.Email]);

            input.Email = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.Email]);
            input.LoweredEmail = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.LoweredEmail]);
            input.PasswordQuestion = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.PasswordQuestion]);
            input.PasswordAnswer = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.PasswordAnswer]);
            input.IsApproved = Utilities.ToBool(reader[Medical.Apartment.Common.AspUser.ColumnNames.IsApproved]);
            input.IsLockedOut = Utilities.ToBool(reader[Medical.Apartment.Common.AspUser.ColumnNames.IsLockedOut]);
            input.CreationDate = Utilities.ToDateTime(reader[Medical.Apartment.Common.AspUser.ColumnNames.CreateDate]);
            input.LastLoginDate = Utilities.ToDateTime(reader[Medical.Apartment.Common.AspUser.ColumnNames.LastLoginDate]);
            input.LastPasswordChangedDate = Utilities.ToDateTime(reader[Medical.Apartment.Common.AspUser.ColumnNames.LastPasswordChangedDate]);
            input.LastLockoutDate = Utilities.ToDateTime(reader[Medical.Apartment.Common.AspUser.ColumnNames.LastLockoutDate]);

            input.FailedPasswordAttemptCount = Utilities.ToInt(reader[Medical.Apartment.Common.AspUser.ColumnNames.FailedPasswordAttemptCount]);
            input.FailedPasswordAttemptWindowStart = Utilities.ToDateTime(reader[Medical.Apartment.Common.AspUser.ColumnNames.FailedPasswordAttemptWindowStart]);
            input.FailedPasswordAnswerAttemptCount = Utilities.ToInt(reader[Medical.Apartment.Common.AspUser.ColumnNames.FailedPasswordAnswerAttemptCount]);
            input.FailedPasswordAnswerAttemptWindowStart = Utilities.ToDateTime(reader[Medical.Apartment.Common.AspUser.ColumnNames.FailedPasswordAnswerAttemptWindowStart]);
            input.Comment = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.Comment]);
            input.UserName = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.UserName]);
            input.LoweredUserName = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.LoweredUserName]);
            input.MobileAlias = Utilities.ToString(reader[Medical.Apartment.Common.AspUser.ColumnNames.MobileAlias]);

            input.IsAnonymous = Utilities.ToBool(reader[Medical.Apartment.Common.AspUser.ColumnNames.IsAnonymous]);
            
            input.OrganisationId = Utilities.ToNInt(reader[Medical.Apartment.Common.AspUser.ColumnNames.OrganisationId]);
            input.SiteId = Utilities.ToNInt(reader[Medical.Apartment.Common.AspUser.ColumnNames.SiteId]);
            if (reader.ColumnExists(Medical.Apartment.Common.AspUser.ColumnNames.MinRoleLevel))
                input.MinRoleLevel = Utilities.ToNInt(reader[Medical.Apartment.Common.AspUser.ColumnNames.MinRoleLevel]);
            else
                input.MinRoleLevel = 1000;
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillAspUserList(List<AspUser> list, System.Data.IDataReader reader)
        {
            list.Clear();
            AspUser item;
            while (true)
            {
                item = Factory.AspUser(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region Country
        public static Country Country(System.Data.IDataReader reader)
        {
            Country result = null;

            if (null != reader && reader.Read())
            {
                result = new Country();
                PopulateCountry(result, reader);
            }

            return result;
        }

        public static void PopulateCountry(Country input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.CountryId = Utilities.ToInt(reader[Medical.Apartment.Common.Country.ColumnNames.CountryId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.Country.ColumnNames.Name]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillCountryList(List<Country> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Country item;
            while (true)
            {
                item = Factory.Country(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region City
        public static City City(System.Data.IDataReader reader)
        {
            City result = null;

            if (null != reader && reader.Read())
            {
                result = new City();
                PopulateCity(result, reader);
            }

            return result;
        }

        public static void PopulateCity(City input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.CityId = Utilities.ToInt(reader[Medical.Apartment.Common.City.ColumnNames.CityId]);
            input.CountryId = Utilities.ToInt(reader[Medical.Apartment.Common.City.ColumnNames.CountryId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.City.ColumnNames.Name]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillCityList(List<City> list, System.Data.IDataReader reader)
        {
            list.Clear();
            City item;
            while (true)
            {
                item = Factory.City(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region District
        public static District District(System.Data.IDataReader reader)
        {
            District result = null;

            if (null != reader && reader.Read())
            {
                result = new District();
                PopulateDistrict(result, reader);
            }

            return result;
        }

        public static void PopulateDistrict(District input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.DistrictId = Utilities.ToInt(reader[Medical.Apartment.Common.District.ColumnNames.DistrictId]);
            input.CityId = Utilities.ToInt(reader[Medical.Apartment.Common.District.ColumnNames.CityId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.District.ColumnNames.Name]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillDistrictList(List<District> list, System.Data.IDataReader reader)
        {
            list.Clear();
            District item;
            while (true)
            {
                item = Factory.District(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region ContactInformation
        public static ContactInformation ContactInformation(System.Data.IDataReader reader)
        {
            ContactInformation result = null;

            if (null != reader && reader.Read())
            {
                result = new ContactInformation();
                PopulateContactInformation(result, reader);
            }

            return result;
        }

        public static void PopulateContactInformation(ContactInformation input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = Utilities.ToInt(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.ContactInformationId]);
            input.ContactTypeId = Utilities.ToInt(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.ContactTypeId]);
            input.FirstName = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.FirstName]);
            input.LastName = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.LastName]);
            input.Address = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.Address]);
            input.Address2 = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.Address2]);
            input.District = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.District]);
            input.DistrictId = Utilities.ToNInt(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.DistrictId]);
            input.City = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.City]);
            input.CityId = Utilities.ToNInt(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.CityId]);
            input.State = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.State]);
            input.Postcode = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.Postcode]);
            input.CountryId = Utilities.ToNInt(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.CountryId]);
            input.PhoneNumber = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.PhoneNumber]);
            input.FaxNumber = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.FaxNumber]);
            input.Email = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.Email]);
            input.DoB = Utilities.ToNDateTime(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.DoB]);
            input.Visa = Utilities.ToString(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.Visa]);
            input.VisaValidFrom = Utilities.ToNDateTime(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.VisaValidFrom]);
            input.VisaValidTo = Utilities.ToNDateTime(reader[Medical.Apartment.Common.ContactInformation.ColumnNames.VisaValidTo]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillContactInformationList(List<ContactInformation> list, System.Data.IDataReader reader)
        {
            list.Clear();
            ContactInformation item;
            while (true)
            {
                item = Factory.ContactInformation(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region Organisation
        /// <summary>
        /// Populate a Organisation object.
        /// </summary>
        /// <param name="input">The Organisation object to populate.</param>
        /// <param name="reader">The data reader from which to populate the Organisation object.</param>
        public static void PopulateOrganisation(Organisation input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.OrganisationId = Utilities.ToInt(reader["OrganisationID"]);
            input.Name = Utilities.ToString(reader["Name"]);
            input.ContactInformationId = Utilities.ToInt(reader["ContactInformationID"]);
            input.DisplayIndex = Utilities.ToInt(reader["DisplayIndex"]);
            input.IsLegacy = Utilities.ToBool(reader["IsLegacy"]);
            input.AuthorisationCode = Utilities.ToString(reader["AuthorisationCode"]);            
        }

        /// <summary>
        /// Creates a Organisation object using data from a data reader.
        /// </summary>
        /// <param name="reader">A data reader containing a key and corresponding value for each property of a Organisation object.</param>
        /// <returns>A populated Organisation object.</returns>
        public static Organisation PopulateOrganisation(System.Data.IDataReader reader)
        {
            Organisation result = null;
            if (reader != null && reader.Read())
            {
                result = new Organisation();
                PopulateOrganisation(result, reader);
            }
            return result;
        }

        /// <summary>
        /// Populates a generic Organisation list with data from a data reader.
        /// </summary>
        /// <param name="list">The Organisation list to be populated.</param>
        /// <param name="reader">A data reader containing data for zero or more Organisation records.</param>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void PopulateOrganisationList(List<Organisation> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Organisation item;
            while (true)
            {
                item = Factory.PopulateOrganisation(reader);
                if (item == null) break;
                list.Add(item);
            }
        }
        #endregion

        #region Site
        /// <summary>
        /// Populate a Site object.
        /// </summary>
        /// <param name="input">The Site object to populate.</param>
        /// <param name="reader">The data reader from which to populate the Site object.</param>
        public static void PopulateSite(Site input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.SiteId = Utilities.ToInt(reader["SiteID"]);
            input.OrganisationId = Utilities.ToInt(reader["OrganisationId"]);
            input.Name = Utilities.ToString(reader["Name"]);
            input.AbbreviatedName = Utilities.ToString(reader["AbbreviatedName"]);
            input.ContactInformationID = Utilities.ToNInt(reader["ContactInformationID"]);
            input.LicenseKey = Utilities.ToNGuid(reader["LicenseKey"]);
            input.PropCode = Utilities.ToString(reader["PropCode"]);
            input.DisplayIndex = Utilities.ToInt(reader["DisplayIndex"]);
            input.IsLegacy = Utilities.ToBool(reader["IsLegacy"]);
            input.Availability = Utilities.ToInt(reader["Availability"]);
        }

        /// <summary>
        /// Creates a Site object using data from a data reader.
        /// </summary>
        /// <param name="reader">A data reader containing a key and corresponding value for each property of a Site object.</param>
        /// <returns>A populated Site object.</returns>
        public static Site PopulateSite(System.Data.IDataReader reader)
        {
            Site result = null;
            if (reader != null && reader.Read())
            {
                result = new Site();
                PopulateSite(result, reader);
            }
            return result;
        }

        /// <summary>
        /// Populates a generic Site list with data from a data reader.
        /// </summary>
        /// <param name="list">The Site list to be populated.</param>
        /// <param name="reader">A data reader containing data for zero or more Site records.</param>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void PopulateSiteList(List<Site> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Site item;
            while (true)
            {
                item = Factory.PopulateSite(reader);
                if (item == null) break;
                list.Add(item);
            }
        }
        #endregion

        #region Customer
        public static Customer Customer(System.Data.IDataReader reader)
        {
            Customer result = null;

            if (null != reader && reader.Read())
            {
                result = new Customer();
                PopulateCustomer(result, reader);
            }

            return result;
        }

        public static void PopulateCustomer(Customer input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = Utilities.ToInt(reader[Medical.Apartment.Common.Customer.ColumnNames.CustomerId]);
            input.OrganisationId = Utilities.ToInt(reader[Medical.Apartment.Common.Customer.ColumnNames.OrganisationId]);
            input.SiteId = Utilities.ToNInt(reader[Medical.Apartment.Common.Customer.ColumnNames.SiteId]);
            input.SiteName = Utilities.ToString(reader[Medical.Apartment.Common.Customer.ColumnNames.SiteName]);
            input.FirstName = Utilities.ToString(reader[Medical.Apartment.Common.Customer.ColumnNames.FirstName]);
            input.LastName = Utilities.ToString(reader[Medical.Apartment.Common.Customer.ColumnNames.LastName]);
            input.IsLegacy = Utilities.ToBool(reader[Medical.Apartment.Common.Customer.ColumnNames.IsLegacy]);
            input.Gender = Utilities.ToNInt(reader[Medical.Apartment.Common.Customer.ColumnNames.Gender]);
            input.DoB = Utilities.ToNDateTime(reader[Medical.Apartment.Common.Customer.ColumnNames.DoB]);
            input.ContactInformationId = Utilities.ToInt(reader[Medical.Apartment.Common.Customer.ColumnNames.ContactInformationId]);                        
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillCustomerList(List<Customer> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Customer item;
            while (true)
            {
                item = Factory.Customer(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region Doctor
        public static Doctor Doctor(System.Data.IDataReader reader)
        {
            Doctor result = null;

            if (null != reader && reader.Read())
            {
                result = new Doctor();
                PopulateDoctor(result, reader);
            }

            return result;
        }

        public static void PopulateDoctor(Doctor input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = Utilities.ToInt(reader[Medical.Apartment.Common.Doctor.ColumnNames.DoctorId]);
            input.OrganisationId = Utilities.ToInt(reader[Medical.Apartment.Common.Doctor.ColumnNames.OrganisationId]);
            input.SiteId = Utilities.ToInt(reader[Medical.Apartment.Common.Doctor.ColumnNames.SiteId]);
            input.SiteName = Utilities.ToString(reader[Medical.Apartment.Common.Doctor.ColumnNames.SiteName]);
            input.FirstName = Utilities.ToString(reader[Medical.Apartment.Common.Doctor.ColumnNames.FirstName]);
            input.LastName = Utilities.ToString(reader[Medical.Apartment.Common.Doctor.ColumnNames.LastName]);
            input.IsLegacy = Utilities.ToBool(reader[Medical.Apartment.Common.Doctor.ColumnNames.IsLegacy]);
            input.Gender = Utilities.ToNInt(reader[Medical.Apartment.Common.Doctor.ColumnNames.Gender]);
            input.DoB = Utilities.ToNDateTime(reader[Medical.Apartment.Common.Doctor.ColumnNames.DoB]);
            input.ContactInformationId = Utilities.ToInt(reader[Medical.Apartment.Common.Doctor.ColumnNames.ContactInformationId]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillDoctorList(List<Doctor> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Doctor item;
            while (true)
            {
                item = Factory.Doctor(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region TagVersions
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void PopulateTagVersionsList(List<TagVersion> list, System.Data.IDataReader reader)
        {
            list.Clear();

            while (reader.Read())
            {
                TagVersion item = new TagVersion();
                PopulateTagVersion(item, reader);

                list.Add(item);
            }
        }

        public static void PopulateTagVersion(TagVersion input, System.Data.IDataReader reader)
        {
            input.TagVersionID = Utilities.ToInt(reader[TagVersion.ColumnNames.TagVersionID]);
            input.TagName = Utilities.ToString(reader[TagVersion.ColumnNames.TagName]);
            input.Version = Utilities.ToString(reader[TagVersion.ColumnNames.Version]);
            input.DateCreated = Utilities.ToDateTime(reader[TagVersion.ColumnNames.DateCreated]);
            input.CreatedBy = Utilities.ToString(reader[TagVersion.ColumnNames.CreatedBy]);
        }

        public static TagVersion PopulateTagVersion(System.Data.IDataReader reader)
        {
            TagVersion result = null;
            if (null != reader && reader.Read())
            {
                result = new TagVersion();
                PopulateTagVersion(result, reader);
            }

            return result;
        }
        #endregion

        #region Medicine

        public static Medicine Medicine(System.Data.IDataReader reader)
        {
            Medicine result = null;

            if (null != reader && reader.Read())
            {
                result = new Medicine();
                PopulateMedicine(result, reader);
            }

            return result;
        }

        public static void PopulateMedicine(Medicine input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.MedicineId = Utilities.ToInt(reader[Medical.Apartment.Common.Medicine.ColumnNames.MedicineId]);
            input.OrganisationId = Utilities.ToInt(reader[Medical.Apartment.Common.Medicine.ColumnNames.OrganisationId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.Medicine.ColumnNames.Name]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.Medicine.ColumnNames.Description]);
            input.IsLegacy = Utilities.ToBool(reader[Medical.Apartment.Common.Medicine.ColumnNames.IsLegacy]);
            input.Price = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Medicine.ColumnNames.Price]);
            input.InputPrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Medicine.ColumnNames.InputPrice]);
            input.Unit = Utilities.ToString(reader[Medical.Apartment.Common.Medicine.ColumnNames.Unit]);
            if (reader.ColumnExists(Medical.Apartment.Common.Medicine.ColumnNames.Quantity))
            {
                input.Quantity = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Medicine.ColumnNames.Quantity]);
                input.SoldQuantity = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Medicine.ColumnNames.SoldQuantity]);
                input.BeginPeriodQuantity = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Medicine.ColumnNames.BeginPeriodQuantity]);
            }
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillMedicineList(List<Medicine> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Medicine item;
            while (true)
            {
                item = Factory.Medicine(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region MedicineInput

        public static MedicineInput MedicineInput(System.Data.IDataReader reader)
        {
            MedicineInput result = null;

            if (null != reader && reader.Read())
            {
                result = new MedicineInput();
                PopulateMedicineInput(result, reader);
            }

            return result;
        }

        public static void PopulateMedicineInput(MedicineInput input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.MedicineInputId = Utilities.ToInt(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.MedicineInputId]);
            input.SiteId = Utilities.ToInt(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.SiteId]);
            input.MedicineId = Utilities.ToInt(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.MedicineId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.Name]);
            input.Date = Utilities.ToDateTime(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.Date]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.Description]);
            input.Quantity = Utilities.ToNDecimal(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.Quantity]);
            input.InputPrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.InputPrice]);
            input.Supplier = Utilities.ToString(reader[Medical.Apartment.Common.MedicineInput.ColumnNames.Supplier]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillMedicineInputList(List<MedicineInput> list, System.Data.IDataReader reader)
        {
            list.Clear();
            MedicineInput item;
            while (true)
            {
                item = Factory.MedicineInput(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region Service

        public static Service Service(System.Data.IDataReader reader)
        {
            Service result = null;

            if (null != reader && reader.Read())
            {
                result = new Service();
                PopulateService(result, reader);
            }

            return result;
        }

        public static void PopulateService(Service input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.ServiceId = Utilities.ToInt(reader[Medical.Apartment.Common.Service.ColumnNames.ServiceId]);
            input.OrganisationId = Utilities.ToInt(reader[Medical.Apartment.Common.Service.ColumnNames.OrganisationId]);
            input.Name = Utilities.ToString(reader[Medical.Apartment.Common.Service.ColumnNames.Name]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.Service.ColumnNames.Description]);
            input.IsLegacy = Utilities.ToBool(reader[Medical.Apartment.Common.Service.ColumnNames.IsLegacy]);
            input.Price = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Service.ColumnNames.Price]);
            input.Unit = Utilities.ToString(reader[Medical.Apartment.Common.Service.ColumnNames.Unit]);

        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillServiceList(List<Service> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Service item;
            while (true)
            {
                item = Factory.Service(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region Image

        public static Image Image(System.Data.IDataReader reader)
        {
            Image result = null;

            if (null != reader && reader.Read())
            {
                result = new Image();
                PopulateImage(result, reader);
            }

            return result;
        }

        public static void PopulateImage(Image input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.ImageId = Utilities.ToInt(reader[Medical.Apartment.Common.Image.ColumnNames.ImageId]);
            input.ImageTypeId = Utilities.ToInt(reader[Medical.Apartment.Common.Image.ColumnNames.ImageTypeId]);
            input.ItemId = Utilities.ToInt(reader[Medical.Apartment.Common.Image.ColumnNames.ItemId]);
            input.FileName = Utilities.ToString(reader[Medical.Apartment.Common.Image.ColumnNames.FileName]);
            input.ImageContent = Utilities.ToByteArray(reader[Medical.Apartment.Common.Image.ColumnNames.ImageContent]);
            input.ImageSmallContent = Utilities.ToByteArray(reader[Medical.Apartment.Common.Image.ColumnNames.ImageSmallContent]);
            input.DisplayIndex = Utilities.ToNInt(reader[Medical.Apartment.Common.Image.ColumnNames.DisplayIndex]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.Image.ColumnNames.Description]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillImageList(List<Image> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Image item;
            while (true)
            {
                item = Factory.Image(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region Treatment

        public static Treatment Treatment(System.Data.IDataReader reader)
        {
            Treatment result = null;

            if (null != reader && reader.Read())
            {
                result = new Treatment();
                PopulateTreatment(result, reader);
            }

            return result;
        }

        public static void PopulateTreatment(Treatment input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.TreatmentId = Utilities.ToInt(reader[Medical.Apartment.Common.Treatment.ColumnNames.TreatmentId]);
            input.CustomerId = Utilities.ToInt(reader[Medical.Apartment.Common.Treatment.ColumnNames.CustomerId]);
            input.CustomerName = Utilities.ToString(reader[Medical.Apartment.Common.Treatment.ColumnNames.CustomerName]);
            input.DoctorId = Utilities.ToInt(reader[Medical.Apartment.Common.Treatment.ColumnNames.DoctorId]);
            input.DoctorName = Utilities.ToString(reader[Medical.Apartment.Common.Treatment.ColumnNames.DoctorName]);
            input.Date = Utilities.ToDateTime(reader[Medical.Apartment.Common.Treatment.ColumnNames.Date]);            
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.Treatment.ColumnNames.Description]);
            input.TotalPrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.Treatment.ColumnNames.TotalPrice]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillTreatmentList(List<Treatment> list, System.Data.IDataReader reader)
        {
            list.Clear();
            Treatment item;
            while (true)
            {
                item = Factory.Treatment(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region TreatmentMedicine

        public static TreatmentMedicine TreatmentMedicine(System.Data.IDataReader reader)
        {
            TreatmentMedicine result = null;

            if (null != reader && reader.Read())
            {
                result = new TreatmentMedicine();
                PopulateTreatmentMedicine(result, reader);
            }

            return result;
        }

        public static void PopulateTreatmentMedicine(TreatmentMedicine input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.TreatmentMedicineId = Utilities.ToInt(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.TreatmentMedicineId]);
            input.TreatmentId = Utilities.ToInt(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.TreatmentId]);
            input.MedicineId = Utilities.ToInt(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.MedicineId]);
            input.Medicine = Utilities.ToString(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.Medicine]);
            input.Quantity = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.Quantity]);
            input.Unit = Utilities.ToString(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.Unit]);
            input.Price = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.Price]);
            input.TotalPrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.TotalPrice]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.Description]);
            input.BasePrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentMedicine.ColumnNames.BasePrice]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillTreatmentMedicineList(List<TreatmentMedicine> list, System.Data.IDataReader reader)
        {
            list.Clear();
            TreatmentMedicine item;
            while (true)
            {
                item = Factory.TreatmentMedicine(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

        #region TreatmentService

        public static TreatmentService TreatmentService(System.Data.IDataReader reader)
        {
            TreatmentService result = null;

            if (null != reader && reader.Read())
            {
                result = new TreatmentService();
                PopulateTreatmentService(result, reader);
            }

            return result;
        }

        public static void PopulateTreatmentService(TreatmentService input, System.Data.IDataReader reader)
        {
            PopulateRecord(input, reader);
            input.RecordId = input.TreatmentServiceId = Utilities.ToInt(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.TreatmentServiceId]);
            input.TreatmentId = Utilities.ToInt(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.TreatmentId]);
            input.ServiceId = Utilities.ToInt(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.ServiceId]);
            input.Service = Utilities.ToString(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.Service]);
            input.Quantity = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.Quantity]);
            input.Unit = Utilities.ToString(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.Unit]);
            input.Price = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.Price]);
            input.TotalPrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.TotalPrice]);
            input.Description = Utilities.ToString(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.Description]);
            input.BasePrice = Utilities.ToNDecimal(reader[Medical.Apartment.Common.TreatmentService.ColumnNames.BasePrice]);
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static void FillTreatmentServiceList(List<TreatmentService> list, System.Data.IDataReader reader)
        {
            list.Clear();
            TreatmentService item;
            while (true)
            {
                item = Factory.TreatmentService(reader);
                if (null == item) break;
                list.Add(item);
            }
        }
        #endregion

    }
}
