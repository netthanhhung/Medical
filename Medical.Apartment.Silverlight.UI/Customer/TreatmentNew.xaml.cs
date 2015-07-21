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
using System.Windows.Media.Imaging;
using System.IO;
using common = Medical.Apartment.Common;
using Medical.Apartment.Common;

namespace Medical.Apartment.Silverlight.UI
{
    public partial class TreatmentNew : UserControl
    {
        /*  ======================================================================            
         *      EVENTS AND DELEGATES
         *  ====================================================================== */
        public int? SiteId { get; set; }
        /*  ======================================================================            
         *      EVENT HANDLERS
         *  ====================================================================== */
        public TreatmentNew()
        {
            InitializeComponent();
            FillLanguage();
            ucSitePicker.Init();
            ucSitePicker.InitComplete += new EventHandler(ucSitePicker_InitComplete);
            ucSitePicker.SelectionChanged += new SelectionChangedEventHandler(ucSitePicker_SelectionChanged);
            DataServiceHelper.ListDoctorAsync(Globals.UserLogin.UserOrganisationId, null, null, null, null, false, ListDoctorCompleted);
        }

        void ListDoctorCompleted(List<Doctor> doctors)
        {
            uiDoctor.ItemsSource = doctors;
            if (doctors.Count > 0)
            {
                uiDoctor.SelectedIndex = 0;
            }
        }
        void FillLanguage()
        {
            uiTitle.Text = ResourceHelper.GetReourceValue("TreatmentNew_uiTitle");
            lblSite.Text = ResourceHelper.GetReourceValue("Common_lblSite");
            lblDoctor.Text = ResourceHelper.GetReourceValue("TreatmentAdmin_Doctor");
            lblDescription.Text = ResourceHelper.GetReourceValue("Common_Description");

            ucCustomerDetails.lblCustomerTitle.Text = ResourceHelper.GetReourceValue("TreatmentAdmin_CustomerName");

            btnOK.Content = ResourceHelper.GetReourceValue("Common_btnSave");
            btnCancel.Content = ResourceHelper.GetReourceValue("Common_btnCancel");
        }

        void ucSitePicker_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ucSitePicker.SiteId > 0)
            {                
                //DataServiceHelper.ListRoomAsync(Globals.UserLogin.UserOrganisationId, ucSitePicker.SiteId, null, null,
                //    roomStatusId, null, null, false, ListRoomCompleted);
            }
        }


        void ucSitePicker_InitComplete(object sender, EventArgs e)
        {
            ContactInformation newContact = new ContactInformation();
            ucCustomerDetails.ucCntactInfoPanel.DataContext = newContact;

            if (this.SiteId > 0)
            {
                ucSitePicker.SiteId = this.SiteId.Value;
            }
        }

        public bool CheckValidation()
        {
            bool result = true;
            

            if (result)
            {
                result = ucCustomerDetails.CheckValidation();
            }

            return result;
        }

        public Treatment GetSavedTreatment()
        {            
            Treatment newItem = new Treatment();
            newItem.Description = uiDescription.Text;
            newItem.Date = DateTime.Now;
            Customer customer = ucCustomerDetails.CustomerItem;
            if (customer != null)
            {
                newItem.CustomerId = customer.CustomerId;
                newItem.CustomerName = customer.FullName;
            }
            newItem.IsChanged = true;

            return newItem;
        }

    }
}
