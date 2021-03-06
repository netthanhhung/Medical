﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Telerik.Windows.Controls;
using Medical.Apartment.Common;

namespace Medical.Apartment.Silverlight.UI
{
    public partial class ServiceAdminPage : Page
    {
        private int _selectedServiceId;
        private List<Service> _originalItemSource = new List<Service>();
        
        public List<UserRoleAuth> UserRoleAuths { get; set; }

        public ServiceAdminPage()
        {
            InitializeComponent();
            UserRoleAuths = SecurityHelper.GetUserRoleAuths((int)LayoutComponentType.ServiceAdmin);

            if (!Globals.UserLogin.IsUserOrganisationAdministrator)
            {
                this.Content = SecurityHelper.GetNoPermissionInfoPanel();
                return;
            }
            FillLanguage();
            SecurityChecking();
            BeginRebindService();
            
            //Services
            btnSaveService.Click += new RoutedEventHandler(btnSaveService_Click);
            btnCancelService.Click += new RoutedEventHandler(btnCancelService_Click);
            gvwServices.AddingNewDataItem += new EventHandler<Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs>(gvwServices_AddingNewDataItem);
            //gvwServices.BeginningEdit += new EventHandler<Telerik.Windows.Controls.GridViewBeginningEditRoutedEventArgs>(gvwServices_BeginningEdit);
            gvwServices.CellValidating += new EventHandler<Telerik.Windows.Controls.GridViewCellValidatingEventArgs>(gvwServices_CellValidating);
            gvwServices.SelectionChanged += new EventHandler<SelectionChangeEventArgs>(gvwServices_SelectionChanged);

            gridImages.Visibility = System.Windows.Visibility.Collapsed;
            ucImageUpload.ImageType = ImageType.Service;
            
            //Common
            UiHelper.ApplyMouseWheelScrollViewer(scrollViewerService);
        }


        void FillLanguage()
        {
            uiTitle.Text = ResourceHelper.GetReourceValue("ServiceAdminPage_uiTitle");
            gvwServices.Columns["ServiceName"].Header = ResourceHelper.GetReourceValue("ServiceAdminPage_ServiceName");
            gvwServices.Columns["Description"].Header = ResourceHelper.GetReourceValue("ServiceAdminPage_Description");
            gvwServices.Columns["Price"].Header = ResourceHelper.GetReourceValue("ServiceAdminPage_Price");
            gvwServices.Columns["Unit"].Header = ResourceHelper.GetReourceValue("ServiceAdminPage_Unit");
            gvwServices.Columns["Inactive"].Header = ResourceHelper.GetReourceValue("ServiceAdminPage_Inactive");

            btnSaveService.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelService.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
        }


        void SecurityChecking()
        {
            //Security
            btnSaveService.IsEnabled = this.UserRoleAuths.Count(i => i.WriteRight == true) > 0;
            ucImageUpload.IsReadOnly = !btnSaveService.IsEnabled;
        }

        private void BeginRebindService()
        {
            Globals.IsBusy = true;
            DataServiceHelper.ListServiceAsync(Globals.UserLogin.UserOrganisationId, null, true, ListServiceCompleted);
        }

        void ListServiceCompleted(List<Service> orgList)
        {
            Globals.IsBusy = false;
            _originalItemSource.Clear();
            foreach (Service item in orgList)
            {
                item.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(ServiceItem_PropertyChanged);
                _originalItemSource.Add(item);
            }
            gvwServices.ItemsSource = orgList;
            if (_selectedServiceId > 0 && orgList.Count(i => i.ServiceId == _selectedServiceId) > 0)
            {
                gvwServices.SelectedItem = orgList.First(i => i.ServiceId == _selectedServiceId);
            }
            else if (orgList.Count > 0)
            {
                gvwServices.SelectedItem = orgList[0];
            }
        }

        #region Service GridView
        private void gvwServices_CellValidating(object sender, Telerik.Windows.Controls.GridViewCellValidatingEventArgs e)
        {
            if (e.Cell.Column.UniqueName == "ServiceName")
            {
                if (e.NewValue.ToString().Length < 1)
                {
                    e.IsValid = false;
                    e.ErrorMessage = ResourceHelper.GetReourceValue("Common_RequiredFieldGeneric");
                }
                else if (e.NewValue.ToString().Length > 128)
                {
                    e.IsValid = false;
                    e.ErrorMessage = ResourceHelper.GetReourceValue("Common_NameLengthErrorMessage");
                }
            }
        }


        void gvwServices_AddingNewDataItem(object sender, Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs e)
        {
            Service newItem = new Service();
            newItem.RecordId = null;
            newItem.CreatedBy = Globals.UserLogin.UserName;
            newItem.OrganisationId = Globals.UserLogin.UserOrganisationId;
            newItem.IsChanged = true;
            e.NewObject = newItem;

        }

        void btnCancelService_Click(object sender, RoutedEventArgs e)
        {
            if (gvwServices.SelectedItem != null)
                _selectedServiceId = ((Service)gvwServices.SelectedItem).ServiceId;
            BeginRebindService();
        }

        void btnSaveService_Click(object sender, RoutedEventArgs e)
        {
            if (gvwServices.SelectedItem != null)
                _selectedServiceId = ((Service)gvwServices.SelectedItem).ServiceId;
            List<Service> oldList = (List<Service>)gvwServices.ItemsSource;
			List<Service> saveList = oldList.Where(d => (d.IsChanged || d.NullableRecordId == null)).ToList();
            Globals.IsBusy = true;
            DataServiceHelper.SaveServiceAsync(saveList, SaveServiceCompleted);

        }

        private void SaveServiceCompleted()
        {
            Globals.IsBusy = false;
            //Reload data
            BeginRebindService();
            MessageBox.Show(Globals.UserMessages.RecordsSaved);
        }


        void ServiceItem_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            Service item = sender as Service;
            if (item != null && e.PropertyName != "IsChanged")
            {
                item.IsChanged = true;
            }
        }

        void gvwServices_SelectionChanged(object sender, SelectionChangeEventArgs e)
        {
            Service selectedService = gvwServices.SelectedItem as Service;
            if (selectedService != null && selectedService.ServiceId > 0)
            {
                gridImages.Visibility = System.Windows.Visibility.Visible;
                _selectedServiceId = selectedService.ServiceId;
                ucImageUpload.ItemId = _selectedServiceId;
                ucImageUpload.BeginRebind();

            }
            else
            {
                _selectedServiceId = -1;
                gridImages.Visibility = System.Windows.Visibility.Collapsed;
            }
        }
        #endregion


    }
}
