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
    public partial class MedicineAdminPage : Page
    {
        private int _selectedMedicineId;
        private List<Medicine> _originalItemSource = new List<Medicine>();

        public List<UserRoleAuth> UserRoleAuths { get; set; }

        public MedicineAdminPage()
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
            BeginRebindMedicine();

            //Medicines
            btnSaveMedicine.Click += new RoutedEventHandler(btnSaveMedicine_Click);
            btnCancelMedicine.Click += new RoutedEventHandler(btnCancelMedicine_Click);
            gvwMedicines.AddingNewDataItem += new EventHandler<Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs>(gvwMedicines_AddingNewDataItem);
            //gvwMedicines.BeginningEdit += new EventHandler<Telerik.Windows.Controls.GridViewBeginningEditRoutedEventArgs>(gvwMedicines_BeginningEdit);
            gvwMedicines.CellValidating += new EventHandler<Telerik.Windows.Controls.GridViewCellValidatingEventArgs>(gvwMedicines_CellValidating);
            gvwMedicines.SelectionChanged += new EventHandler<Telerik.Windows.Controls.SelectionChangeEventArgs>(gvwMedicines_SelectionChanged);

            gridImages.Visibility = System.Windows.Visibility.Collapsed;
            ucImageUpload.ImageType = ImageType.Medicine;

            //Common
            UiHelper.ApplyMouseWheelScrollViewer(scrollViewerMedicine);
        }


        void FillLanguage()
        {
            uiTitle.Text = ResourceHelper.GetReourceValue("MedicineAdminPage_uiTitle");
            gvwMedicines.Columns["Name"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Name");
            gvwMedicines.Columns["Description"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Description");
            //gvwMedicines.Columns["InputPrice"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_InputPrice");
            gvwMedicines.Columns["Unit"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Unit");
            gvwMedicines.Columns["Price"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Price");
            gvwMedicines.Columns["Inactive"].Header = ResourceHelper.GetReourceValue("MedicineAdminPage_Inactive");

            btnSaveMedicine.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelMedicine.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
        }

        void SecurityChecking()
        {
            //Security
            btnSaveMedicine.IsEnabled = this.UserRoleAuths.Count(i => i.WriteRight == true) > 0;
            ucImageUpload.IsReadOnly = !btnSaveMedicine.IsEnabled;
        }

        private void BeginRebindMedicine()
        {
            Globals.IsBusy = true;
            DataServiceHelper.ListMedicineAsync(Globals.UserLogin.UserOrganisationId, null, true, ListMedicineCompleted);
        }

        void ListMedicineCompleted(List<Medicine> orgList)
        {
            Globals.IsBusy = false;
            _originalItemSource.Clear();
            foreach (Medicine item in orgList)
            {
                item.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(MedicineItem_PropertyChanged);
                _originalItemSource.Add(item);
            }
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

        #region Medicine GridView
        private void gvwMedicines_CellValidating(object sender, Telerik.Windows.Controls.GridViewCellValidatingEventArgs e)
        {
            if (e.Cell.Column.UniqueName == "MedicineName")
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


        void gvwMedicines_AddingNewDataItem(object sender, Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs e)
        {
            Medicine newItem = new Medicine();
            newItem.RecordId = null;
            newItem.CreatedBy = Globals.UserLogin.UserName;
            newItem.OrganisationId = Globals.UserLogin.UserOrganisationId;
            newItem.IsChanged = true;
            e.NewObject = newItem;

        }

        void btnCancelMedicine_Click(object sender, RoutedEventArgs e)
        {
            if (gvwMedicines.SelectedItem != null)
                _selectedMedicineId = ((Medicine)gvwMedicines.SelectedItem).MedicineId;
            BeginRebindMedicine();
        }

        void btnSaveMedicine_Click(object sender, RoutedEventArgs e)
        {
            if (gvwMedicines.SelectedItem != null)
                _selectedMedicineId = ((Medicine)gvwMedicines.SelectedItem).MedicineId;
            List<Medicine> oldList = (List<Medicine>)gvwMedicines.ItemsSource;
            List<Medicine> saveList = oldList.Where(d => (d.IsChanged || d.NullableRecordId == null)).ToList();
            Globals.IsBusy = true;
            DataServiceHelper.SaveMedicineAsync(saveList, SaveMedicineCompleted);

        }

        private void SaveMedicineCompleted()
        {
            Globals.IsBusy = false;
            //Reload data
            BeginRebindMedicine();
            MessageBox.Show(Globals.UserMessages.RecordsSaved);
        }


        void MedicineItem_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            Medicine item = sender as Medicine;
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
                gridImages.Visibility = System.Windows.Visibility.Visible;
                _selectedMedicineId = selectedMedicine.MedicineId;
                ucImageUpload.ItemId = _selectedMedicineId;
                ucImageUpload.BeginRebind();

            }
            else
            {
                _selectedMedicineId = -1;
                gridImages.Visibility = System.Windows.Visibility.Collapsed;
            }
        }

        #endregion

    }
}
