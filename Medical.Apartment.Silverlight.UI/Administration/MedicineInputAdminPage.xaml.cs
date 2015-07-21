using System;
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
    public partial class MedicineInputAdminPage : Page
    {
        private int _selectedMedicineId;
        private List<MedicineInput> _originalItemSource = new List<MedicineInput>();

        public List<UserRoleAuth> UserRoleAuths { get; set; }

        public MedicineInputAdminPage()
        {
            InitializeComponent();
            UserRoleAuths = SecurityHelper.GetUserRoleAuths((int)LayoutComponentType.MedicineAdmin);

            if (!Globals.UserLogin.IsUserOrganisationAdministrator)
            {
                this.Content = SecurityHelper.GetNoPermissionInfoPanel();
                return;
            }
            FillLanguage();
            SecurityChecking();
            ucSitePicker.InitComplete += new EventHandler(ucSitePicker_InitComplete);
            //Medicines
            btnSaveMedicineInput.Click += new RoutedEventHandler(btnSaveMedicineInput_Click);
            btnCancelMedicineInput.Click += new RoutedEventHandler(btnCancelMedicineInput_Click);
            gvwMedicineInput.AddingNewDataItem += new EventHandler<Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs>(gvwMedicineInput_AddingNewDataItem);
            gvwMedicines.SelectionChanged += new EventHandler<Telerik.Windows.Controls.SelectionChangeEventArgs>(gvwMedicines_SelectionChanged);

            gridMedicineIput.Visibility = System.Windows.Visibility.Collapsed;
            uiDateFrom.SelectedDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            uiDateTo.SelectedDate = uiDateFrom.SelectedDate.Value.AddMonths(1).AddDays(-1);

            //Common
            UiHelper.ApplyMouseWheelScrollViewer(scrollViewerMedicine);
            ucSitePicker.Init();
            btnSearch.Click += new RoutedEventHandler(btnSearch_Click);
        }

        void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            BeginRebindMedicine();
        }

        void ucSitePicker_InitComplete(object sender, EventArgs e)
        {
            BeginRebindMedicine();
        }

        void FillLanguage()
        {
            lblFromDate.Text = ResourceHelper.GetReourceValue("Common_From");
            lblToDate.Text = ResourceHelper.GetReourceValue("Common_To");
            lblSite.Text = ResourceHelper.GetReourceValue("Common_lblSite");

            uiTitle.Text = ResourceHelper.GetReourceValue("MedicineAdminPage_uiTitle");
            gvwMedicines.Columns["Name"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Name");
            gvwMedicines.Columns["Description"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Description");
            gvwMedicines.Columns["Unit"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Unit");
            gvwMedicines.Columns["Price"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Price");
            gvwMedicines.Columns["BeginPeriodQuantity"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_BeginPeriodQuantity");
            gvwMedicines.Columns["Quantity"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Quantity");
            gvwMedicines.Columns["SoldQuantity"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_SoldQuantity");

            gvwMedicineInput.Columns["Date"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Date");
            gvwMedicineInput.Columns["Quantity"].Header = ResourceHelper.GetReourceValue("Common_Quantity");
            gvwMedicineInput.Columns["Supplier"].Header = ResourceHelper.GetReourceValue("Common_Supplier");
            gvwMedicineInput.Columns["InputPrice"].Header = ResourceHelper.GetReourceValue("Common_InputPrice");
            gvwMedicineInput.Columns["Description"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Description");
            gvwMedicineInput.Columns["Quantity"].Footer = ResourceHelper.GetReourceValue("Common_TotalPrice");

            btnSaveMedicineInput.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelMedicineInput.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
            btnSearch.Content = ResourceHelper.GetReourceValue("Common_btnSearch");
        }

        void SecurityChecking()
        {
            //Security
            btnSaveMedicineInput.IsEnabled = this.UserRoleAuths.Count(i => i.WriteRight == true) > 0;
        }

        private void BeginRebindMedicine()
        {
            if (ucSitePicker.SiteId > 0 && uiDateFrom.SelectedDate.HasValue && uiDateTo.SelectedDate.HasValue)
            {
                Globals.IsBusy = true;
                DataServiceHelper.ListSiteMedicineStatusAsync(ucSitePicker.SiteId, null, uiDateFrom.SelectedDate.Value, uiDateTo.SelectedDate.Value, false, ListMedicineCompleted);
            }
        }

        void ListMedicineCompleted(List<Medicine> orgList)
        {
            Globals.IsBusy = false;
            gvwMedicines.ItemsSource = orgList;
            if (_selectedMedicineId > 0 && orgList.Count(i => i.MedicineId == _selectedMedicineId) > 0)
            {
                gvwMedicines.SelectedItem = orgList.First(i => i.MedicineId == _selectedMedicineId);
            }
            else if (orgList.Count > 0)
            {
                gvwMedicines.SelectedItem = orgList[0];
            }
        }

        private void BeginRebindMedicineInput(Medicine selectedMedicine)
        {
            if (selectedMedicine != null
                && ucSitePicker.SiteId > 0 && uiDateFrom.SelectedDate.HasValue && uiDateTo.SelectedDate.HasValue)
            {
                Globals.IsBusy = true;
                DataServiceHelper.ListMedicineInputAsync(ucSitePicker.SiteId, selectedMedicine.MedicineId,
                    uiDateFrom.SelectedDate.Value, uiDateTo.SelectedDate.Value, ListMedicineInputCompleted);
            }
        }

        void ListMedicineInputCompleted(List<MedicineInput> inputList)
        {
            Globals.IsBusy = false;
            _originalItemSource.Clear();
            foreach (MedicineInput item in inputList)
            {
                item.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(MedicineInputItem_PropertyChanged);
                _originalItemSource.Add(item);
            }
            gvwMedicineInput.ItemsSource = inputList;

        }

        #region Medicine GridView


        void gvwMedicineInput_AddingNewDataItem(object sender, Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs e)
        {
            Medicine selectedMedicine = gvwMedicines.SelectedItem as Medicine;
            if (selectedMedicine != null && selectedMedicine.MedicineId > 0)
            {
                MedicineInput newItem = new MedicineInput();
                newItem.RecordId = null;
                newItem.CreatedBy = Globals.UserLogin.UserName;
                newItem.MedicineId = selectedMedicine.MedicineId;
                newItem.Date = DateTime.Now;
                newItem.SiteId = ucSitePicker.SiteId;
                newItem.IsChanged = true;
                e.NewObject = newItem;
            }
        }

        void btnCancelMedicineInput_Click(object sender, RoutedEventArgs e)
        {
            if (gvwMedicineInput.SelectedItem != null)
                _selectedMedicineId = ((Medicine)gvwMedicineInput.SelectedItem).MedicineId;
            BeginRebindMedicine();
        }

        void btnSaveMedicineInput_Click(object sender, RoutedEventArgs e)
        {
            List<MedicineInput> oldList = (List<MedicineInput>)gvwMedicineInput.ItemsSource;
            List<MedicineInput> saveList = oldList.Where(d => (d.IsChanged || d.NullableRecordId == null)).ToList();
            Globals.IsBusy = true;
            DataServiceHelper.SaveMedicineInputAsync(saveList, SaveMedicineInputCompleted);

        }

        private void SaveMedicineInputCompleted()
        {
            Globals.IsBusy = false;
            //Reload data
            gvwMedicines_SelectionChanged(null, null);
            MessageBox.Show(Globals.UserMessages.RecordsSaved);
        }


        void MedicineInputItem_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            MedicineInput item = sender as MedicineInput;
            if (item != null && e.PropertyName != "IsChanged")
            {
                item.IsChanged = true;
            }
        }



        void gvwMedicines_SelectionChanged(object sender, SelectionChangeEventArgs e)
        {

            Medicine selectedMedicine = gvwMedicines.SelectedItem as Medicine;
            if (selectedMedicine != null && selectedMedicine.MedicineId > 0)
            {
                gridMedicineIput.Visibility = System.Windows.Visibility.Visible;
                _selectedMedicineId = selectedMedicine.MedicineId;
                BeginRebindMedicineInput(selectedMedicine);

            }
            else
            {
                _selectedMedicineId = -1;
                gridMedicineIput.Visibility = System.Windows.Visibility.Collapsed;
            }
        }

        #endregion


    }
}
