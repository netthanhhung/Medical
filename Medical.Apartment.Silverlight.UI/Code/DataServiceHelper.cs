﻿using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Xml.Linq;
using System.Linq;
using Medical.Apartment.Common;
using System.IO;
using common = Medical.Apartment.Common;
using Medical.Apartment.Silverlight.UI.ApartmentService;

namespace Medical.Apartment.Silverlight.UI
{
	public static class DataServiceHelper
	{
		/*  ======================================================================            
		 *      EVENTS AND DELEGATES
		 *  ====================================================================== */
		internal delegate void EmptyCallback();
		internal delegate void DataServiceCallback<T>(T returnValue);
		internal delegate void DataServiceIEnumerableCallback<T>(IEnumerable<T> itemsSource);
		internal delegate void DataServiceListCallback<T>(List<T> itemsSource);


		/*  ======================================================================            
		 *      PAGE MEMBERS
		 *  ====================================================================== */
		private static Dictionary<Guid, Delegate> _callbacks = new Dictionary<Guid, Delegate>();
		private static Dictionary<Guid, Object[]> _params = new Dictionary<Guid, Object[]>();

		/*  ======================================================================            
		 *      EVENT HANDLERS
		 *  ====================================================================== */
        private static ApartmentServiceClient GetProxy()
		{
			return GetProxy(Guid.Empty, null);
		}

        private static ApartmentServiceClient GetProxy(Guid callerKey, Delegate callback)
		{
            ApartmentServiceClient result = new ApartmentServiceClient();
			// Rely on the endpoint addresses being setup within ServiceReferences.ClientConfig instead.
			// result.Endpoint.Address = new EndpointAddress(Globals.EndPointAddresses.DataService);            
			if (callback != null)
			{
				_callbacks.Add(callerKey, callback);
			}

			return result;
		}

		
		/*  ======================================================================            
		 *      EVENT HANDLERS
		 *  ====================================================================== */
		static void proxy_VoidMethodCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
		{
			Guid callerKey = (Guid)e.UserState;
			if (_callbacks.ContainsKey(callerKey))
			{
				((EmptyCallback)_callbacks[callerKey]).Invoke();

				_callbacks.Remove(callerKey);
			}
		}

        /*  ======================================================================            
		 *      Methods
		 *  ====================================================================== */
        internal static void SelectSessionId()
        {
            ApartmentServiceClient proxy = GetProxy();
            proxy.SelectSessionIdAsync();
        }

        //GetGlobalVariableAsync
        internal delegate void GetGlobalVariableCallBack(GlobalVariable itemSource);
        internal static void GetGlobalVariableAsync(GetGlobalVariableCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.GetGlobalVariableCompleted += new EventHandler<GetGlobalVariableCompletedEventArgs>(proxy_GetGlobalVariableCompleted);
            proxy.GetGlobalVariableAsync(callerKey);
        }

        static void proxy_GetGlobalVariableCompleted(object sender, GetGlobalVariableCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                GlobalVariable itemSource = e.Result;
                ((GetGlobalVariableCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        // ChangePasswordAsync
        internal delegate void ChangePasswordCallback(int status);
        internal static void ChangePasswordAsync(string oldPassword, string newPassword, ChangePasswordCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ChangePasswordCompleted += new EventHandler<ChangePasswordCompletedEventArgs>(proxy_ChangePasswordCompleted);
            proxy.ChangePasswordAsync(oldPassword, newPassword, callerKey);
        }

        static void proxy_ChangePasswordCompleted(object sender, ChangePasswordCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                int status = e.Result;

                ((ChangePasswordCallback)_callbacks[callerKey]).Invoke(status);

                _callbacks.Remove(callerKey);
            }
        }

        // ListAspUser
        internal delegate void ListAspUserCallback(List<AspUser> itemSource);
        internal static void ListAspUserAsync(int? orgId, Guid? userId, bool? isLegacy, ListAspUserCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListAspUserCompleted += new EventHandler<ListAspUserCompletedEventArgs>(proxy_ListAspUserCompleted);
            proxy.ListAspUserAsync(orgId, userId, isLegacy, callerKey);
        }

        static void proxy_ListAspUserCompleted(object sender, ListAspUserCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<AspUser> itemSource = e.Result;
                ((ListAspUserCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        // UnlockAspUser
        internal delegate void UnlockAspUserCallBack(AspUser oldUser);
        internal static void UnlockAspUserAsync(AspUser oldUser, UnlockAspUserCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.UnlockAspUserCompleted += new EventHandler<UnlockAspUserCompletedEventArgs>(proxy_UnlockAspUserCompleted);
            proxy.UnlockAspUserAsync(oldUser, callerKey);
        }

        static void proxy_UnlockAspUserCompleted(object sender, UnlockAspUserCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                AspUser itemSource = e.Result;
                ((UnlockAspUserCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //Save AspUser
        internal delegate void SaveAspUserCallBack(AspUser result);
        internal static void SaveAspUserAsync(AspUser saveUser, SaveAspUserCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveAspUserCompleted += new EventHandler<SaveAspUserCompletedEventArgs>(proxy_SaveAspUserCompleted);
            proxy.SaveAspUserAsync(saveUser, callerKey);
        }

        static void proxy_SaveAspUserCompleted(object sender, SaveAspUserCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                AspUser result = e.Result;
                ((SaveAspUserCallBack)_callbacks[callerKey]).Invoke(result);

                _callbacks.Remove(callerKey);
            }
        }

        // ListCountry
        internal delegate void ListCountryCallback(List<Country> itemSource);
        internal static void ListCountryAsync(int? countryId, ListCountryCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListCountryCompleted += new EventHandler<ListCountryCompletedEventArgs>(proxy_ListCountryCompleted);
            proxy.ListCountryAsync(countryId, callerKey);
        }

        static void proxy_ListCountryCompleted(object sender, ListCountryCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Country> itemSource = e.Result;
                ((ListCountryCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        // ListCity
        internal delegate void ListCityCallback(List<City> itemSource);
        internal static void ListCityAsync(int? countryid, int? cityId, ListCityCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListCityCompleted += new EventHandler<ListCityCompletedEventArgs>(proxy_ListCityCompleted);
            proxy.ListCityAsync(countryid, cityId, callerKey);
        }

        static void proxy_ListCityCompleted(object sender, ListCityCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<City> itemSource = e.Result;
                ((ListCityCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        // ListDistrict
        internal delegate void ListDistrictCallback(List<District> itemSource);
        internal static void ListDistrictAsync(int? cityId, int? districtId, ListDistrictCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListDistrictCompleted += new EventHandler<ListDistrictCompletedEventArgs>(proxy_ListDistrictCompleted);
            proxy.ListDistrictAsync(cityId, districtId, callerKey);
        }

        static void proxy_ListDistrictCompleted(object sender, ListDistrictCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<District> itemSource = e.Result;
                ((ListDistrictCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        internal delegate void ListOrganisationCallback(List<Organisation> itemSource);
        internal static void ListOrganisationAsync(Guid? roleId, ListOrganisationCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListOrganisationCompleted += new EventHandler<ListOrganisationCompletedEventArgs>(proxy_ListOrganisationCompleted);
            proxy.ListOrganisationAsync(roleId, callerKey);
        }

        static void proxy_ListOrganisationCompleted(object sender, ListOrganisationCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Organisation> itemSource = new List<Organisation>();
                if (e.Result != null)
                    itemSource = e.Result;
                ((ListOrganisationCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //GetOrganisation
        internal delegate void GetOrganisationCallBack(Organisation itemSource);
        internal static void GetOrganisationAsync(int organisationId, GetOrganisationCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.GetOrganisationCompleted += new EventHandler<GetOrganisationCompletedEventArgs>(proxy_GetOrganisationCompleted);
            proxy.GetOrganisationAsync(organisationId, callerKey);
        }

        static void proxy_GetOrganisationCompleted(object sender, GetOrganisationCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                Organisation itemSource = e.Result;
                ((GetOrganisationCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveOrganisation
        internal static void SaveOrganisationAsync(List<Organisation> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveOrganisationsCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveOrganisationsAsync(saveList, callerKey);
        }

        internal delegate void ListSiteCallback(List<Site> itemSource);
        internal static void ListSiteAsync(int? orgId, int? siteId, bool showLegacy, bool loadContact, ListSiteCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListSiteCompleted += new EventHandler<ListSiteCompletedEventArgs>(proxy_ListSiteCompleted);
            proxy.ListSiteAsync(orgId, siteId, showLegacy, loadContact, callerKey);
        }

        static void proxy_ListSiteCompleted(object sender, ListSiteCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Site> itemSource = new List<Site>();
                if (e.Result != null)
                    itemSource = e.Result;
                ((ListSiteCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveSite
        internal static void SaveSiteAsync(List<Site> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveSiteCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveSiteAsync(saveList, callerKey);
        }

        // ListContactInformation
        internal delegate void ListContactInformationCallback(List<ContactInformation> itemSource);
        internal static void ListContactInformationAsync(int? contactInformationId, ListContactInformationCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListContactInformationCompleted += new EventHandler<ListContactInformationCompletedEventArgs>(proxy_ListContactInformationCompleted);
            proxy.ListContactInformationAsync(contactInformationId, callerKey);
        }

        static void proxy_ListContactInformationCompleted(object sender, ListContactInformationCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<ContactInformation> itemSource = e.Result;
                ((ListContactInformationCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveContactInformation
        internal static void SaveContactInformationAsync(List<ContactInformation> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveContactInformationCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveContactInformationAsync(saveList, callerKey);
        }

        // ListCustomer
        internal delegate void ListCustomerCallback(List<Customer> itemSource);
        internal static void ListCustomerAsync(int? orgId, int? siteId, int? customerId, string firstName, string lastName,
            bool hasContracts, DateTime? contractDateStart, DateTime? contractDateEnd, bool includeLegacy, ListCustomerCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListCustomerCompleted += new EventHandler<ListCustomerCompletedEventArgs>(proxy_ListCustomerCompleted);
            proxy.ListCustomerAsync(orgId, siteId, customerId, firstName, lastName, hasContracts, contractDateStart, contractDateEnd, includeLegacy, callerKey);
        }

        static void proxy_ListCustomerCompleted(object sender, ListCustomerCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Customer> itemSource = e.Result;
                ((ListCustomerCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveCustomer        
        internal static void SaveCustomerAsync(List<Customer> saveList, ListCustomerCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveCustomerCompleted += new EventHandler<SaveCustomerCompletedEventArgs>(proxy_SaveCustomerCompleted);
            proxy.SaveCustomerAsync(saveList, callerKey);
        }

        static void proxy_SaveCustomerCompleted(object sender, SaveCustomerCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Customer> itemSource = e.Result;
                ((ListCustomerCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }
        // ListDoctor
        internal delegate void ListDoctorCallback(List<Doctor> itemSource);
        internal static void ListDoctorAsync(int? orgId, int? siteId, int? doctorId, string firstName, string lastName, bool includeLegacy, ListDoctorCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListDoctorCompleted += new EventHandler<ListDoctorCompletedEventArgs>(proxy_ListDoctorCompleted);
            proxy.ListDoctorAsync(orgId, siteId, doctorId, firstName, lastName, includeLegacy, callerKey);
        }

        static void proxy_ListDoctorCompleted(object sender, ListDoctorCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Doctor> itemSource = e.Result;
                ((ListDoctorCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveDoctor        
        internal static void SaveDoctorAsync(List<Doctor> saveList, ListDoctorCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveDoctorCompleted += new EventHandler<SaveDoctorCompletedEventArgs>(proxy_SaveDoctorCompleted);
            proxy.SaveDoctorAsync(saveList, callerKey);
        }

        static void proxy_SaveDoctorCompleted(object sender, SaveDoctorCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Doctor> itemSource = e.Result;
                ((ListDoctorCallback)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        #region Security
        // ListComponent
        internal delegate void ListComponentCallBack(List<Component> itemSource);
        internal static void ListComponentAsync(int? componentId, ListComponentCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListComponentCompleted += new EventHandler<ListComponentCompletedEventArgs>(proxy_ListComponentCompleted);
            proxy.ListComponentAsync(componentId, callerKey);
        }

        static void proxy_ListComponentCompleted(object sender, ListComponentCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Component> itemSource = e.Result;
                ((ListComponentCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        // ListRoleComponentPermission
        internal delegate void ListRoleComponentPermissionCallBack(List<RoleComponentPermission> itemSource);
        internal static void ListRoleComponentPermissionAsync(Guid? roleId, int? componentId, ListRoleComponentPermissionCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListRoleComponentPermissionCompleted += new EventHandler<ListRoleComponentPermissionCompletedEventArgs>(proxy_ListRoleComponentPermissionCompleted);
            proxy.ListRoleComponentPermissionAsync(roleId, componentId, callerKey);
        }

        static void proxy_ListRoleComponentPermissionCompleted(object sender, ListRoleComponentPermissionCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<RoleComponentPermission> itemSource = e.Result;
                ((ListRoleComponentPermissionCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        internal static void SaveRoleComponentPermissionAsync(List<RoleComponentPermission> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveRoleComponentPermissionCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveRoleComponentPermissionAsync(saveList, callerKey);
        }

        // ListAspRole
        internal delegate void ListAspRoleCallBack(List<AspRole> itemSource);
        internal static void ListAspRoleAsync(Guid? roleId, ListAspRoleCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListAspRoleCompleted += new EventHandler<ListAspRoleCompletedEventArgs>(proxy_ListAspRoleCompleted);
            proxy.ListAspRoleAsync(roleId, callerKey);
        }

        static void proxy_ListAspRoleCompleted(object sender, ListAspRoleCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<AspRole> itemSource = e.Result;
                ((ListAspRoleCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        internal static void SaveAspRoleAsync(List<AspRole> saveList, string currentUser, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveAspRoleCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveAspRoleAsync(saveList, currentUser, callerKey);
        }

        // ListUserRoleAuth
        internal delegate void ListUserRoleAuthCallBack(List<UserRoleAuth> itemSource);
        internal static void ListUserRoleAuthAsync(int? orgId, Guid? userId, Guid? roleId, ListUserRoleAuthCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListUserRoleAuthCompleted += new EventHandler<ListUserRoleAuthCompletedEventArgs>(proxy_ListUserRoleAuthCompleted);
            proxy.ListUserRoleAuthAsync(orgId, userId, roleId, callerKey);
        }

        static void proxy_ListUserRoleAuthCompleted(object sender, ListUserRoleAuthCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<UserRoleAuth> itemSource = e.Result;
                ((ListUserRoleAuthCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        internal static void SaveUserRoleAuthAsync(List<UserRoleAuth> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveUserRoleAuthCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveUserRoleAuthAsync(saveList, callerKey);
        }

        // ListOrgAdminAspUser
        internal delegate void ListOrgAdminAspUserCallBack(List<AspUser> itemSource);
        internal static void ListOrgAdminAspUserAsync(int orgId, Guid roleid, ListOrgAdminAspUserCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListOrgAdminAspUserCompleted += new EventHandler<ListOrgAdminAspUserCompletedEventArgs>(proxy_ListOrgAdminAspUserCompleted);
            proxy.ListOrgAdminAspUserAsync(orgId, roleid, callerKey);
        }

        static void proxy_ListOrgAdminAspUserCompleted(object sender, ListOrgAdminAspUserCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<AspUser> itemSource = e.Result;
                ((ListOrgAdminAspUserCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        #endregion

        // ListMedicine
        internal delegate void ListMedicineCallBack(List<Medicine> itemSource);
        internal static void ListMedicineAsync(int? organisationId, int? MedicineId, bool showLegacy, ListMedicineCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListMedicineCompleted += new EventHandler<ListMedicineCompletedEventArgs>(proxy_ListMedicineCompleted);
            proxy.ListMedicineAsync(organisationId, MedicineId, showLegacy, callerKey);
        }

        static void proxy_ListMedicineCompleted(object sender, ListMedicineCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Medicine> itemSource = e.Result;
                ((ListMedicineCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveMedicine
        internal static void SaveMedicineAsync(List<Medicine> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveMedicineCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveMedicineAsync(saveList, callerKey);
        }

        // ListSiteMedicineStatus
        internal delegate void ListSiteMedicineStatusCallBack(List<Medicine> itemSource);
        internal static void ListSiteMedicineStatusAsync(int siteId, int? medicineId, DateTime dateFrom, DateTime dateTo, bool showLegacy, ListSiteMedicineStatusCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListSiteMedicineStatusCompleted += new EventHandler<ListSiteMedicineStatusCompletedEventArgs>(proxy_ListSiteMedicineStatusCompleted);
            proxy.ListSiteMedicineStatusAsync(siteId, medicineId, dateFrom, dateTo, showLegacy, callerKey);
        }

        static void proxy_ListSiteMedicineStatusCompleted(object sender, ListSiteMedicineStatusCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Medicine> itemSource = e.Result;
                ((ListSiteMedicineStatusCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        // ListMedicineInput
        internal delegate void ListMedicineInputCallBack(List<MedicineInput> itemSource);
        internal static void ListMedicineInputAsync(int siteId, int? medicineId, DateTime dateFrom, DateTime dateTo, ListMedicineInputCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListMedicineInputCompleted += new EventHandler<ListMedicineInputCompletedEventArgs>(proxy_ListMedicineInputCompleted);
            proxy.ListMedicineInputAsync(siteId, medicineId, dateFrom, dateTo, callerKey);
        }

        static void proxy_ListMedicineInputCompleted(object sender, ListMedicineInputCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<MedicineInput> itemSource = e.Result;
                ((ListMedicineInputCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveMedicineInput
        internal static void SaveMedicineInputAsync(List<MedicineInput> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveMedicineInputCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveMedicineInputAsync(saveList, callerKey);
        }

        // ListService
        internal delegate void ListServiceCallBack(List<Service> itemSource);
        internal static void ListServiceAsync(int? organisationId, int? serviceId, bool showLegacy, ListServiceCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListServiceCompleted += new EventHandler<ListServiceCompletedEventArgs>(proxy_ListServiceCompleted);
            proxy.ListServiceAsync(organisationId, serviceId, showLegacy, callerKey);
        }

        static void proxy_ListServiceCompleted(object sender, ListServiceCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Service> itemSource = e.Result;
                ((ListServiceCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveService
        internal static void SaveServiceAsync(List<Service> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveServiceCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveServiceAsync(saveList, callerKey);
        }

     


        // ListImage
        internal delegate void ListImageCallBack(List<common.Image> itemSource);
        internal static void ListImageAsync(int? imageId, int? itemId, int? imageTypeId, int loadType, ListImageCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListImageCompleted += new EventHandler<ListImageCompletedEventArgs>(proxy_ListImageCompleted);
            proxy.ListImageAsync(imageId, itemId, imageTypeId, loadType, callerKey);
        }

        static void proxy_ListImageCompleted(object sender, ListImageCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<common.Image> itemSource = e.Result;
                ((ListImageCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveImage
        internal static void SaveImageAsync(List<common.Image> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveImageCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveImageAsync(saveList, callerKey);
        }

        // ListTreatment
        internal delegate void ListTreatmentCallBack(List<Treatment> itemSource);
        internal static void ListTreatmentAsync(int orgId, int? siteId, int? customerId, int? doctorId, int? treatmentId, DateTime? dateStart, DateTime? dateEnd, ListTreatmentCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListTreatmentCompleted += new EventHandler<ListTreatmentCompletedEventArgs>(proxy_ListTreatmentCompleted);
            proxy.ListTreatmentAsync(orgId, siteId, customerId, doctorId, treatmentId, dateStart, dateEnd, callerKey);
        }

        static void proxy_ListTreatmentCompleted(object sender, ListTreatmentCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<Treatment> itemSource = e.Result;
                ((ListTreatmentCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveTreatment
        internal static void SaveTreatmentAsync(List<Treatment> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveTreatmentCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveTreatmentAsync(saveList, callerKey);
        }


        // ListTreatmentMedicine
        internal delegate void ListTreatmentMedicineCallBack(List<TreatmentMedicine> itemSource);
        internal static void ListTreatmentMedicineAsync(int? treatmentMedicineId, int? treatmnentId, ListTreatmentMedicineCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListTreatmentMedicineCompleted += new EventHandler<ListTreatmentMedicineCompletedEventArgs>(proxy_ListTreatmentMedicineCompleted);
            proxy.ListTreatmentMedicineAsync(treatmentMedicineId, treatmnentId, callerKey);
        }

        static void proxy_ListTreatmentMedicineCompleted(object sender, ListTreatmentMedicineCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<TreatmentMedicine> itemSource = e.Result;
                ((ListTreatmentMedicineCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveTreatmentMedicine
        internal static void SaveTreatmentMedicineAsync(List<TreatmentMedicine> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveTreatmentMedicineCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveTreatmentMedicineAsync(saveList, callerKey);
        }


        // ListTreatmentService
        internal delegate void ListTreatmentServiceCallBack(List<TreatmentService> itemSource);
        internal static void ListTreatmentServiceAsync(int? treatmentServiceId, int? treatmnentId, ListTreatmentServiceCallBack callback)
        {
            Guid callerKey = Guid.NewGuid();

            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.ListTreatmentServiceCompleted += new EventHandler<ListTreatmentServiceCompletedEventArgs>(proxy_ListTreatmentServiceCompleted);
            proxy.ListTreatmentServiceAsync(treatmentServiceId, treatmnentId, callerKey);
        }

        static void proxy_ListTreatmentServiceCompleted(object sender, ListTreatmentServiceCompletedEventArgs e)
        {
            Guid callerKey = (Guid)e.UserState;
            if (_callbacks.ContainsKey(callerKey))
            {
                List<TreatmentService> itemSource = e.Result;
                ((ListTreatmentServiceCallBack)_callbacks[callerKey]).Invoke(itemSource);

                _callbacks.Remove(callerKey);
            }
        }

        //SaveTreatmentService
        internal static void SaveTreatmentServiceAsync(List<TreatmentService> saveList, EmptyCallback callback)
        {
            Guid callerKey = Guid.NewGuid();
            ApartmentServiceClient proxy = GetProxy(callerKey, callback);
            proxy.SaveTreatmentServiceCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_VoidMethodCompleted);
            proxy.SaveTreatmentServiceAsync(saveList, callerKey);
        }
	}
}
