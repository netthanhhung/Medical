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
    public partial class DoctorAdminPage : Page
    {
        private const int _defaultCountryId = 232;    

        private int _seletedDoctorId;
        private List<Doctor> _originalItemSource = new List<Doctor>();
         
        public List<UserRoleAuth> UserRoleAuths { get; set; }

        public DoctorAdminPage()
        {
            InitializeComponent();

            UserRoleAuths = SecurityHelper.GetUserRoleAuths((int)LayoutComponentType.DoctorAdmin);
            if (this.UserRoleAuths == null)
            {
                this.Content = SecurityHelper.GetNoPermissionInfoPanel();
                return;
            }
            btnSaveDoctor.IsEnabled = ucCntactInfoPanel.IsEnabled
                = this.UserRoleAuths.Count(i => i.WriteRight == true) > 0;
            FillLanguage();

            btnSaveDoctor.Click += new RoutedEventHandler(btnSaveDoctor_Click);
            btnCancelDoctor.Click += new RoutedEventHandler(btnCancelDoctor_Click);
            gvwDoctors.SelectionChanged += new EventHandler<Telerik.Windows.Controls.SelectionChangeEventArgs>(gvwDoctors_SelectionChanged);
            gvwDoctors.AddingNewDataItem += new EventHandler<Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs>(gvwDoctors_AddingNewDataItem);            
            gvwDoctors.CellValidating += new EventHandler<Telerik.Windows.Controls.GridViewCellValidatingEventArgs>(gvwDoctors_CellValidating);
            gvwDoctors.RowEditEnded += new EventHandler<GridViewRowEditEndedEventArgs>(gvwDoctors_RowEditEnded);

            Dictionary<int, string> genderDic = new Dictionary<int, string>();
            genderDic.Add(-1, string.Empty);
            genderDic.Add((int)Enums.Gender.Male, Enums.Gender.Male.ToString());
            genderDic.Add((int)Enums.Gender.Female, Enums.Gender.Female.ToString());
            ((GridViewComboBoxColumn)this.gvwDoctors.Columns["Gender"]).ItemsSource = genderDic;

            ucCntactInfoPanel.btnSaveContact.Visibility = Visibility.Collapsed;
            
            UiHelper.ApplyMouseWheelScrollViewer(scrollViewerDoctors);
            DataServiceHelper.ListSiteAsync(Globals.UserLogin.UserOrganisationId, null, false, false, ListSiteCompleted);
        }

        void ListSiteCompleted(List<Site> sites)
        {
            ((GridViewComboBoxColumn)this.gvwDoctors.Columns["Site"]).ItemsSource = sites;
            BeginRebindDoctor();
        }

        void FillLanguage()
        {
            uiTitle.Text = ResourceHelper.GetReourceValue("DoctorAdminPage_uiTitle");
            
            gvwDoctors.Columns["FirstName"].Header = ResourceHelper.GetReourceValue("ContactInformationPanel_lblFirstName");
            gvwDoctors.Columns["LastName"].Header = ResourceHelper.GetReourceValue("ContactInformationPanel_lblLastName");
            gvwDoctors.Columns["Site"].Header = ResourceHelper.GetReourceValue("Common_lblSite");
            gvwDoctors.Columns["DoB"].Header = ResourceHelper.GetReourceValue("CustomerDetails_lblDoB");
            gvwDoctors.Columns["Gender"].Header = ResourceHelper.GetReourceValue("CustomerDetails_lblGender");
            gvwDoctors.Columns["Inactive"].Header = ResourceHelper.GetReourceValue("Common_Inactive");
            gvwDoctors.Columns["Position"].Header = ResourceHelper.GetReourceValue("Common_Position");

            btnSaveDoctor.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelDoctor.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
        }


        private void BeginRebindDoctor()
        {
            Globals.IsBusy = true;
            
            DataServiceHelper.ListDoctorAsync(Globals.UserLogin.UserOrganisationId, null, null, null, null, false, ListDoctorCompleted);
        }

        void ListDoctorCompleted(List<Doctor> doctorList)
        {
            Globals.IsBusy = false;
            _originalItemSource.Clear();
            foreach (Doctor item in doctorList)
            {
                item.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(DoctorItem_PropertyChanged);
                if (item.ContactInformation == null)
                {
                    item.ContactInformation = new ContactInformation();
                    item.ContactInformation.ContactTypeId = (int)ContactType.Doctor;
                    item.ContactInformation.CountryId = 232;
                }
                item.ContactInformation.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(ContactInformation_PropertyChanged);
                _originalItemSource.Add(item);
            }
            gvwDoctors.ItemsSource = doctorList;
            if (_seletedDoctorId > 0 && doctorList.Count(i => i.DoctorId == _seletedDoctorId) > 0)
            {
                gvwDoctors.SelectedItem = doctorList.First(i => i.DoctorId == _seletedDoctorId);
            }
            else if (doctorList.Count > 0)
            {
                gvwDoctors.SelectedItem = doctorList[0];
            }
        }

        #region Doctor GridView
        void gvwDoctors_RowEditEnded(object sender, GridViewRowEditEndedEventArgs e)
        {
            gvwDoctors_SelectionChanged(null, null);
        }

        private void gvwDoctors_CellValidating(object sender, Telerik.Windows.Controls.GridViewCellValidatingEventArgs e)
        {
            if (e.Cell.Column.UniqueName == "FirstName" || e.Cell.Column.UniqueName == "LastName")
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
            //else if (e.Cell.Column.UniqueName == "DisplayIndex")
            //{
            //    int displayindex;
            //     if (!int.TryParse(e.NewValue.ToString(), out displayindex))
            //    {
            //        e.IsValid = false;
            //        e.ErrorMessage = Globals.UserMessages.RequiredFieldGeneric;
            //    }                
            //}
        }

        //void gvwDoctors_BeginningEdit(object sender, Telerik.Windows.Controls.GridViewBeginningEditRoutedEventArgs e)
        //{
        //    if (e.Cell.Column.UniqueName == "NumberOfRooms")
        //    {
        //        e.Cancel = true;
        //    }
        //}

        void gvwDoctors_AddingNewDataItem(object sender, Telerik.Windows.Controls.GridView.GridViewAddingNewEventArgs e)
        {
            Doctor newItem = new Doctor();
            newItem.RecordId = null;
            newItem.OrganisationId = Globals.UserLogin.UserOrganisationId;            
            newItem.CreatedBy = Globals.UserLogin.UserName;
            newItem.DateCreated = Globals.Now;
            newItem.ContactInformation = new ContactInformation();
            newItem.ContactInformation.CountryId = _defaultCountryId;
            newItem.ContactInformation.ContactTypeId = (int)ContactType.Doctor;
            newItem.IsChanged = newItem.ContactInformation.IsChanged = true;
            e.NewObject = newItem;

            ucCntactInfoPanel.Visibility = System.Windows.Visibility.Collapsed;
        }

        void btnCancelDoctor_Click(object sender, RoutedEventArgs e)
        {
            if (gvwDoctors.SelectedItem != null)
                _seletedDoctorId = ((Doctor)gvwDoctors.SelectedItem).DoctorId;
            BeginRebindDoctor();
        }

        void btnSaveDoctor_Click(object sender, RoutedEventArgs e)
        {
            if (gvwDoctors.SelectedItem != null)
                _seletedDoctorId = ((Doctor)gvwDoctors.SelectedItem).DoctorId;
            List<Doctor> oldList = (List<Doctor>)gvwDoctors.ItemsSource;
			List<Doctor> saveList = oldList.Where(d => (d.IsChanged || d.NullableRecordId == null || d.ContactInformation.IsChanged)).ToList();
            Globals.IsBusy = true;
            DataServiceHelper.SaveDoctorAsync(saveList, SaveDoctorCompleted);

            MessageBox.Show(Globals.UserMessages.RecordsSaved);
        }

        void SaveDoctorCompleted(List<Doctor> savedList)
        {
            List<Doctor> oldList = (List<Doctor>)gvwDoctors.ItemsSource;
            List<Doctor> newList = oldList.Where(d => (!d.IsChanged && d.NullableRecordId > 0 && !d.ContactInformation.IsChanged)).ToList();
            savedList.AddRange(newList);
            ListDoctorCompleted(savedList);
        }

        void gvwDoctors_SelectionChanged(object sender, Telerik.Windows.Controls.SelectionChangeEventArgs e)
        {
            if (gvwDoctors.SelectedItem != null)
            {
                Doctor selectedDoctor = gvwDoctors.SelectedItem as Doctor;
                ucCntactInfoPanel.Visibility = System.Windows.Visibility.Collapsed;
                
                if (selectedDoctor != null)
                {
                    _seletedDoctorId = selectedDoctor.DoctorId;
                    if (selectedDoctor.ContactInformation == null)
                    {
                        selectedDoctor.ContactInformation = new ContactInformation();
                        selectedDoctor.ContactInformation.IsChanged = true;
                        selectedDoctor.ContactInformation.CountryId = _defaultCountryId;
                    }
                    ucCntactInfoPanel.DataContext = selectedDoctor.ContactInformation;

                    ucCntactInfoPanel.Visibility = System.Windows.Visibility.Visible;

                }
            }
        }

        void DoctorItem_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            Doctor item = sender as Doctor;
            if (item != null && e.PropertyName != "IsChanged")
            {
                item.IsChanged = true;
                item.UpdatedBy = Globals.UserLogin.UserName;
            }
        }

        void ContactInformation_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            ContactInformation item = sender as ContactInformation;
            if (item != null && e.PropertyName != "IsChanged")
            {
                item.IsChanged = true;
                item.UpdatedBy = Globals.UserLogin.UserName;
            }
        }

        #endregion


    }
}
