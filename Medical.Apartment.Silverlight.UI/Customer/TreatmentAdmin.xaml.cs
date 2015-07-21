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
using Telerik.Windows.Controls.GridView;
using Medical.Apartment.Common;


namespace Medical.Apartment.Silverlight.UI
{
    public partial class TreatmentAdmin : UserControl
    {
        internal event EventHandler RebindTreatmentList;
        /*  ======================================================================            
         *      EVENTS AND DELEGATES
         *  ====================================================================== */                
        private int _selectedTreatmentId = -1;
        private List<Treatment> _originalItemSource = new List<Treatment>();
        private List<TreatmentMedicine> _currentTreatmentMedicines = new List<TreatmentMedicine>();
        private List<TreatmentService> _currentTreatmentServices = new List<TreatmentService>();

        public Customer CustomerItem { get; set; }
        /*  ======================================================================            
         *      EVENT HANDLERS
         *  ====================================================================== */
        public TreatmentAdmin()
        {
            InitializeComponent();
            FillLanguage();

            gvwTreatment.CellValidating += new EventHandler<GridViewCellValidatingEventArgs>(gvwTreatment_CellValidating);
            gvwTreatment.BeginningEdit += new EventHandler<GridViewBeginningEditRoutedEventArgs>(gvwTreatment_BeginningEdit);
            gvwTreatment.SelectionChanged += new EventHandler<SelectionChangeEventArgs>(gvwTreatment_SelectionChanged);
            gvwTreatment.AddingNewDataItem += new EventHandler<GridViewAddingNewEventArgs>(gvwTreatment_AddingNewDataItem);

            btnSaveTreatment.Click += new RoutedEventHandler(btnSaveTreatment_Click);
            btnCancelTreatment.Click += new RoutedEventHandler(btnCancelTreatment_Click);
            
            gridMedicineService.Visibility = gridImages.Visibility = System.Windows.Visibility.Collapsed;
            ucImageUpload.ImageType = ImageType.Treatment;            

            btnSaveTreatmentMedicine.Click += new RoutedEventHandler(btnSaveTreatmentMedicine_Click);
            btnCancelTreatmentMedicine.Click += new RoutedEventHandler(btnCancelTreatmentMedicine_Click);
            btnInsertTreatmentMedicine.Click += new RoutedEventHandler(btnInsertTreatmentMedicine_Click);
            gvwTreatmentMedicine.Deleting += new EventHandler<GridViewDeletingEventArgs>(gvwTreatmentMedicine_Deleting);
            gvwTreatmentMedicine.CellEditEnded +=new EventHandler<GridViewCellEditEndedEventArgs>(gvwTreatmentMedicine_CellEditEnded);

            btnSaveTreatmentService.Click += new RoutedEventHandler(btnSaveTreatmentService_Click);
            btnCancelTreatmentService.Click += new RoutedEventHandler(btnCancelTreatmentService_Click);
            btnInsertTreatmentService.Click += new RoutedEventHandler(btnInsertTreatmentService_Click);
            gvwTreatmentService.Deleting += new EventHandler<GridViewDeletingEventArgs>(gvwTreatmentService_Deleting);
            gvwTreatmentService.CellEditEnded += new EventHandler<GridViewCellEditEndedEventArgs>(gvwTreatmentService_CellEditEnded);

            DataServiceHelper.ListMedicineAsync(Globals.UserLogin.UserOrganisationId, null, false, ListMedicineCompleted);
            DataServiceHelper.ListServiceAsync(Globals.UserLogin.UserOrganisationId, null, false, ListServiceCompleted);
            DataServiceHelper.ListDoctorAsync(Globals.UserLogin.UserOrganisationId, null, null, null, null, false, ListDoctorCompleted);
        }

        public void SetReadonly(bool isReadonly)
        {
            gvwTreatment.ShowInsertRow = !isReadonly;
            gvwTreatment.IsReadOnly = gvwTreatmentMedicine.IsReadOnly = gvwTreatmentService.IsReadOnly = isReadonly;
            btnCancelTreatment.Visibility = btnSaveTreatment.Visibility = uiMedicineList.Visibility = uiServiceList.Visibility
                = btnInsertTreatmentMedicine.Visibility = btnInsertTreatmentService.Visibility
                = btnSaveTreatmentMedicine.Visibility = btnSaveTreatmentService.Visibility
                = btnCancelTreatmentMedicine.Visibility = btnCancelTreatmentService.Visibility
                = isReadonly ? Visibility.Collapsed : Visibility.Visible;
            ucImageUpload.IsReadOnly = isReadonly;
        }

        void ListMedicineCompleted(List<Medicine> medicines)
        {
            uiMedicineList.ItemsSource = medicines;
        }

        void ListServiceCompleted(List<Service> services)
        {
            uiServiceList.ItemsSource = services;
        }

        void ListDoctorCompleted(List<Doctor> doctors)
        {
            ((GridViewComboBoxColumn)this.gvwTreatment.Columns["Doctor"]).ItemsSource = doctors;
        }

        void FillLanguage()
        {
            uiTitle.Text = ResourceHelper.GetReourceValue("TreatmentAdmin_uiTitle");
            gvwTreatment.Columns["Doctor"].Header = ResourceHelper.GetReourceValue("TreatmentAdmin_Doctor");
            gvwTreatment.Columns["CustomerName"].Header = ResourceHelper.GetReourceValue("TreatmentAdmin_CustomerName");
            gvwTreatment.Columns["Date"].Header = ResourceHelper.GetReourceValue("TreatmentAdmin_Date");
            gvwTreatment.Columns["Description"].Header = ResourceHelper.GetReourceValue("Common_Description");
            gvwTreatment.Columns["TotalPrice"].Header = ResourceHelper.GetReourceValue("Common_TotalPrice");
            gvwTreatment.Columns["CustomerName"].Footer = ResourceHelper.GetReourceValue("Common_TotalPrice");

            btnSaveTreatment.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelTreatment.Content = ResourceHelper.GetReourceValue("Common_btnCancel");

            //Medicine
            gvwTreatmentMedicine.Columns["Medicine"].Header = ResourceHelper.GetReourceValue("Common_Medicine");
            gvwTreatmentMedicine.Columns["Description"].Header = ResourceHelper.GetReourceValue("Common_Description");
            gvwTreatmentMedicine.Columns["Unit"].Header = ResourceHelper.GetReourceValue("Common_Unit");
            gvwTreatmentMedicine.Columns["Price"].Header = ResourceHelper.GetReourceValue("Common_Price");
            gvwTreatmentMedicine.Columns["TotalPrice"].Header = ResourceHelper.GetReourceValue("Common_TotalPrice");
            gvwTreatmentMedicine.Columns["Quantity"].Header = ResourceHelper.GetReourceValue("Common_Quantity");

            btnSaveTreatmentMedicine.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelTreatmentMedicine.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
            btnInsertTreatmentMedicine.Content = ResourceHelper.GetReourceValue("Common_btnInsert");

            //Service
            gvwTreatmentService.Columns["Service"].Header = ResourceHelper.GetReourceValue("Common_Service");
            gvwTreatmentService.Columns["Description"].Header = ResourceHelper.GetReourceValue("Common_Description");
            gvwTreatmentService.Columns["Unit"].Header = ResourceHelper.GetReourceValue("Common_Unit");
            gvwTreatmentService.Columns["Price"].Header = ResourceHelper.GetReourceValue("Common_Price");
            gvwTreatmentService.Columns["TotalPrice"].Header = ResourceHelper.GetReourceValue("Common_TotalPrice");
            gvwTreatmentService.Columns["Quantity"].Header = ResourceHelper.GetReourceValue("Common_Quantity");

            btnSaveTreatmentService.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancelTreatmentService.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
            btnInsertTreatmentService.Content = ResourceHelper.GetReourceValue("Common_btnInsert");
        }

        #region Treatment

        void RebindTreatmentData()
        {
            if (RebindTreatmentList != null)
            {
                RebindTreatmentList(this, null);
            }
        }

        public void BindTreatmentList(List<Treatment> itemSource)
        {
            Globals.IsBusy = false;
            _originalItemSource.Clear();
            foreach (Treatment item in itemSource)
            {
                item.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(item_PropertyChanged);
                _originalItemSource.Add(item);
            }

            gvwTreatment.ItemsSource = itemSource;

            if (_selectedTreatmentId > 0 && itemSource.Count(i => i.TreatmentId == _selectedTreatmentId) > 0)
            {
                gvwTreatment.SelectedItem = itemSource.First(i => i.TreatmentId == _selectedTreatmentId);
            }
            else if (itemSource.Count > 0)
            {
                gvwTreatment.SelectedItem = itemSource[0];
            }
        }

        void gvwTreatment_SelectionChanged(object sender, SelectionChangeEventArgs e)
        {
            Treatment selectedTreatment = gvwTreatment.SelectedItem as Treatment;
            if (selectedTreatment != null && selectedTreatment.TreatmentId > 0)
            {
                gridMedicineService.Visibility = gridImages.Visibility = System.Windows.Visibility.Visible;
                _selectedTreatmentId = selectedTreatment.TreatmentId;
                ucImageUpload.ItemId = selectedTreatment.TreatmentId;
                ucImageUpload.BeginRebind();

                //Bind Medicine and Service :
                RebindTreatmentMedicines();
                RebindTreatmentServices();
            }
            else
            {
                _selectedTreatmentId = -1;
                gridMedicineService.Visibility = gridImages.Visibility = System.Windows.Visibility.Collapsed;
            }
        }


        void gvwTreatment_AddingNewDataItem(object sender, GridViewAddingNewEventArgs e)
        {
            if (CustomerItem != null)
            {
                Treatment newItem = new Treatment();
                newItem.CustomerId = CustomerItem.CustomerId;
                newItem.CustomerName = CustomerItem.FullName;
                newItem.Date = DateTime.Now;
                newItem.IsChanged = true;
                newItem.TotalPrice = 0;
                e.NewObject = newItem;
            }
        }


        void gvwTreatment_BeginningEdit(object sender, GridViewBeginningEditRoutedEventArgs e)
        {
            Treatment rowData = e.Row.Item as Treatment;
            //if (rowData.NullableRecordId != null && e.Cell.Column.UniqueName == "DaymarkerType")
            //{
            //    e.Cancel = true;
            //}
        }

        void item_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName != "IsChanged")
            {
                Treatment item = (Treatment)sender;
                item.IsChanged = true;
            }
        }

        void gvwTreatment_CellValidating(object sender, GridViewCellValidatingEventArgs e)
        {
            //if (e.Cell.Column.UniqueName == "TreatmentType" 
            //    || e.Cell.Column.UniqueName == "TreatmentStatus" 
            //    || e.Cell.Column.UniqueName == "TreatmentName")
            //{
            //    if (e.NewValue == null || string.IsNullOrEmpty(e.NewValue.ToString()))
            //    {
            //        e.IsValid = false;
            //        e.ErrorMessage = Globals.UserMessages.RequiredFieldGeneric;
            //    }
            //}
        }

        void btnSaveTreatment_Click(object sender, RoutedEventArgs e)
        {
            if (gvwTreatment.SelectedItem != null)
                _selectedTreatmentId = ((Treatment)gvwTreatment.SelectedItem).TreatmentId;
            List<Treatment> oldList = (List<Treatment>)gvwTreatment.ItemsSource;
            List<Treatment> saveList = oldList.Where(d => (d.IsChanged || d.NullableRecordId == null)).ToList();
            Globals.IsBusy = true;
            DataServiceHelper.SaveTreatmentAsync(saveList, SaveTreatmentCompleted);
        }

        void SaveTreatmentCompleted()
        {
            Globals.IsBusy = false;
            MessageBox.Show(Globals.UserMessages.RecordsSaved);
            RebindTreatmentData();
        }

        void btnCancelTreatment_Click(object sender, RoutedEventArgs e)
        {
            RebindTreatmentData();
        }

        #endregion

        #region TreatmentMedicine
        void gvwTreatmentMedicine_Deleting(object sender, GridViewDeletingEventArgs e)
        {

            if (e.Items != null && e.Items.Count() > 0)
            {
                TreatmentMedicine deleteItem = e.Items.First() as TreatmentMedicine;
                if (deleteItem != null)
                {
                    if (deleteItem.CanDelete)
                    {
                        MessageBoxResult result = MessageBox.Show(ResourceHelper.GetReourceValue("Common_ConfirmDeleteNoParam"), ResourceHelper.GetReourceValue("Common_ConfirmationRequired"), MessageBoxButton.OKCancel);
                        if (result == MessageBoxResult.Cancel)
                        {
                            e.Cancel = true;
                        }
                    }
                    else
                    {
                        MessageBoxResult result = MessageBox.Show(string.Format(ResourceHelper.GetReourceValue("Common_DeleteFailedBeingUsed"), deleteItem.Medicine), 
                            ResourceHelper.GetReourceValue("Common_OperationFailed"), MessageBoxButton.OK);
                        e.Cancel = true;
                    }
                }
            }
            
        }


        private void RebindTreatmentMedicines()
        {
            Treatment selectedTreatment = gvwTreatment.SelectedItem as Treatment;
            if (selectedTreatment != null && selectedTreatment.TreatmentId > 0)
            {
                Globals.IsBusy = true;
                DataServiceHelper.ListTreatmentMedicineAsync(null, selectedTreatment.TreatmentId, ListTreatmentMedicineCompleted);


            }
        }

        
        private void ListTreatmentMedicineCompleted(List<TreatmentMedicine> treatmentMedicines)
        {
            Globals.IsBusy = false;
            _currentTreatmentMedicines.Clear();
            foreach (TreatmentMedicine treatmentMedicine in treatmentMedicines)
            {
                treatmentMedicine.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(TreatmentMedicine_PropertyChanged);
                _currentTreatmentMedicines.Add(treatmentMedicine);
            }
            gvwTreatmentMedicine.ItemsSource = treatmentMedicines;
        }

        void TreatmentMedicine_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName != "IsChanged")
            {
                TreatmentMedicine item = (TreatmentMedicine)sender;
                item.IsChanged = true;
            }
        }

        void btnCancelTreatmentMedicine_Click(object sender, RoutedEventArgs e)
        {
            RebindTreatmentMedicines();
        }

        void btnSaveTreatmentMedicine_Click(object sender, RoutedEventArgs e)
        {
            List<TreatmentMedicine> saveList = (List<TreatmentMedicine>)gvwTreatmentMedicine.ItemsSource;
            //Get delete items :
            foreach (TreatmentMedicine oldItem in _currentTreatmentMedicines)
            {
                bool isDeleted = true;
                foreach (TreatmentMedicine saveItem in saveList)
                {
                    if (saveItem.TreatmentMedicineId == oldItem.TreatmentMedicineId)
                    {
                        isDeleted = false;
                        break;
                    }
                }
                if (isDeleted)
                {
                    oldItem.IsDeleted = true;
                    saveList.Add(oldItem);
                }
            }
            Globals.IsBusy = true;
            DataServiceHelper.SaveTreatmentMedicineAsync(saveList, SaveTreatmentMedicineCompleted);
        }

        void SaveTreatmentMedicineCompleted()
        {
            Globals.IsBusy = false;
            MessageBox.Show(Globals.UserMessages.RecordsSaved);
            RebindTreatmentMedicines();
        }

        void btnInsertTreatmentMedicine_Click(object sender, RoutedEventArgs e)
        {
            Medicine medicine = uiMedicineList.SelectedItem as Medicine;
            if (medicine != null && _selectedTreatmentId > 0)
            {
                List<TreatmentMedicine> list = (List<TreatmentMedicine>)gvwTreatmentMedicine.ItemsSource;
                if (list.Count(i => i.MedicineId == medicine.MedicineId) > 0)
                {
                    MessageBox.Show(ResourceHelper.GetReourceValue("Common_ItemExist"));
                }
                else
                {
                    TreatmentMedicine newTreatmentMedicine = new TreatmentMedicine();
                    newTreatmentMedicine.TreatmentId = _selectedTreatmentId;
                    newTreatmentMedicine.MedicineId = medicine.MedicineId;
                    newTreatmentMedicine.Medicine = medicine.Name;
                    newTreatmentMedicine.IsChanged = true;
                    newTreatmentMedicine.Quantity = 1;
                    newTreatmentMedicine.Price = medicine.Price;
                    newTreatmentMedicine.BasePrice = medicine.Price;
                    newTreatmentMedicine.Unit = medicine.Unit;
                    newTreatmentMedicine.TotalPrice = medicine.Price;
                    newTreatmentMedicine.Description = medicine.Description;
                    list.Add(newTreatmentMedicine);
                    gvwTreatmentMedicine.ItemsSource = null;
                    gvwTreatmentMedicine.ItemsSource = list;
                }
            }
        }

        void gvwTreatmentMedicine_CellEditEnded(object sender, GridViewCellEditEndedEventArgs e)
        {
            if (e.NewData != null && e.Cell.ParentRow.Item != null)
            {
                TreatmentMedicine rowData = (TreatmentMedicine)e.Cell.ParentRow.Item;
                string columnName = e.Cell.Column.UniqueName;
                if (columnName == "Quantity" || columnName == "Price")
                {
                    rowData.TotalPrice = rowData.Quantity * rowData.Price;
                    ReCalculateTreatmentTotalPrice(rowData.TreatmentId);
                }
            }
        }

        #endregion


        #region TreatmentService
        void gvwTreatmentService_Deleting(object sender, GridViewDeletingEventArgs e)
        {

            if (e.Items != null && e.Items.Count() > 0)
            {
                TreatmentService deleteItem = e.Items.First() as TreatmentService;
                if (deleteItem != null)
                {
                    if (deleteItem.CanDelete)
                    {
                        MessageBoxResult result = MessageBox.Show(ResourceHelper.GetReourceValue("Common_ConfirmDeleteNoParam"), ResourceHelper.GetReourceValue("Common_ConfirmationRequired"), MessageBoxButton.OKCancel);
                        if (result == MessageBoxResult.Cancel)
                        {
                            e.Cancel = true;
                        }
                    }
                    else
                    {
                        MessageBoxResult result = MessageBox.Show(string.Format(ResourceHelper.GetReourceValue("Common_DeleteFailedBeingUsed"), deleteItem.Service),
                            ResourceHelper.GetReourceValue("Common_OperationFailed"), MessageBoxButton.OK);
                        e.Cancel = true;
                    }
                }
            }

        }


        private void RebindTreatmentServices()
        {
            Treatment selectedTreatment = gvwTreatment.SelectedItem as Treatment;
            if (selectedTreatment != null && selectedTreatment.TreatmentId > 0)
            {
                Globals.IsBusy = true;
                DataServiceHelper.ListTreatmentServiceAsync(null, selectedTreatment.TreatmentId, ListTreatmentServiceCompleted);


            }
        }


        private void ListTreatmentServiceCompleted(List<TreatmentService> treatmentServices)
        {
            Globals.IsBusy = false;
            _currentTreatmentServices.Clear();
            foreach (TreatmentService treatmentService in treatmentServices)
            {
                treatmentService.PropertyChanged += new System.ComponentModel.PropertyChangedEventHandler(TreatmentService_PropertyChanged);
                _currentTreatmentServices.Add(treatmentService);
            }
            gvwTreatmentService.ItemsSource = treatmentServices;
        }

        void TreatmentService_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName != "IsChanged")
            {
                TreatmentService item = (TreatmentService)sender;
                item.IsChanged = true;
            }
        }

        void btnCancelTreatmentService_Click(object sender, RoutedEventArgs e)
        {
            RebindTreatmentServices();
        }

        void btnSaveTreatmentService_Click(object sender, RoutedEventArgs e)
        {
            List<TreatmentService> saveList = (List<TreatmentService>)gvwTreatmentService.ItemsSource;
            //Get delete items :
            foreach (TreatmentService oldItem in _currentTreatmentServices)
            {
                bool isDeleted = true;
                foreach (TreatmentService saveItem in saveList)
                {
                    if (saveItem.TreatmentServiceId == oldItem.TreatmentServiceId)
                    {
                        isDeleted = false;
                        break;
                    }
                }
                if (isDeleted)
                {
                    oldItem.IsDeleted = true;
                    saveList.Add(oldItem);
                }
            }
            Globals.IsBusy = true;
            DataServiceHelper.SaveTreatmentServiceAsync(saveList, SaveTreatmentServiceCompleted);
        }

        void SaveTreatmentServiceCompleted()
        {
            Globals.IsBusy = false;
            MessageBox.Show(Globals.UserMessages.RecordsSaved);
            RebindTreatmentServices();
        }

        void btnInsertTreatmentService_Click(object sender, RoutedEventArgs e)
        {
            Service Service = uiServiceList.SelectedItem as Service;
            if (Service != null && _selectedTreatmentId > 0)
            {
                List<TreatmentService> list = (List<TreatmentService>)gvwTreatmentService.ItemsSource;
                if (list.Count(i => i.ServiceId == Service.ServiceId) > 0)
                {
                    MessageBox.Show(ResourceHelper.GetReourceValue("Common_ItemExist"));
                }
                else
                {
                    TreatmentService newTreatmentService = new TreatmentService();
                    newTreatmentService.TreatmentId = _selectedTreatmentId;
                    newTreatmentService.ServiceId = Service.ServiceId;
                    newTreatmentService.Service = Service.Name;
                    newTreatmentService.IsChanged = true;
                    newTreatmentService.Quantity = 1;
                    newTreatmentService.Price = Service.Price;
                    newTreatmentService.BasePrice = Service.Price;
                    newTreatmentService.Unit = Service.Unit;
                    newTreatmentService.TotalPrice = Service.Price;
                    newTreatmentService.Description = Service.Description;
                    list.Add(newTreatmentService);
                    gvwTreatmentService.ItemsSource = null;
                    gvwTreatmentService.ItemsSource = list;
                }
            }
        }

        void gvwTreatmentService_CellEditEnded(object sender, GridViewCellEditEndedEventArgs e)
        {
            if (e.NewData != null && e.Cell.ParentRow.Item != null)
            {
                TreatmentService rowData = (TreatmentService)e.Cell.ParentRow.Item;
                string columnName = e.Cell.Column.UniqueName;
                if (columnName == "Quantity" || columnName == "Price")
                {
                    rowData.TotalPrice = rowData.Quantity * rowData.Price;
                    ReCalculateTreatmentTotalPrice(rowData.TreatmentId);
                }
            }
        }


        #endregion


        void ReCalculateTreatmentTotalPrice(int treatmentId)
        {
            List<Treatment> treatments = gvwTreatment.ItemsSource as List<Treatment>;
            List<TreatmentMedicine> treatmentMedicine = gvwTreatmentMedicine.ItemsSource as List<TreatmentMedicine>;
            List<TreatmentService> treatmentService = gvwTreatmentService.ItemsSource as List<TreatmentService>;
            Treatment treatment = treatments.FirstOrDefault(i => i.TreatmentId == treatmentId);
            if (treatment != null)
            {
                treatment.TotalPrice = treatmentMedicine.Sum(i => i.TotalPrice) + treatmentService.Sum(i => i.TotalPrice);
            }
        }
    }
}
