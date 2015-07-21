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
    public partial class TreatmentAdminPage : Page
    {
         
        public List<UserRoleAuth> UserRoleAuths { get; set; }

        public TreatmentAdminPage()
        {
            InitializeComponent();

            UserRoleAuths = ucSitePicker.UserRoleAuths = SecurityHelper.GetUserRoleAuths((int)LayoutComponentType.TreatmentAdmin);
            if (this.UserRoleAuths == null)
            {
                this.Content = SecurityHelper.GetNoPermissionInfoPanel();
                return;
            }
            ucTreatmentAdmin.btnSaveTreatment.IsEnabled = ucTreatmentAdmin.btnSaveTreatmentService.IsEnabled
                = ucTreatmentAdmin.btnInsertTreatmentService.IsEnabled
                = this.UserRoleAuths.Count(i => i.WriteRight == true) > 0;
            FillLanguage();

            ucSitePicker.Init();
            ucSitePicker.InitComplete += new EventHandler(ucSitePicker_InitComplete);
            
            btnSearch.Click += new RoutedEventHandler(btnSearch_Click);
            
            uiDateFrom.SelectedDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            uiDateTo.SelectedDate = DateTime.Today;
            
            UiHelper.ApplyMouseWheelScrollViewer(scrollViewerCustomers);
            ucTreatmentAdmin.SetReadonly(true);
        }


        void FillLanguage()
        {
            uiTitle.Text = ResourceHelper.GetReourceValue("TreatmentAdminPage_uiTitle");
            lblSite.Text = ResourceHelper.GetReourceValue("Common_lblSite");
            lblFromDate.Text = ResourceHelper.GetReourceValue("Common_From");
            lblToDate.Text = ResourceHelper.GetReourceValue("Common_To");
            btnSearch.Content = ResourceHelper.GetReourceValue("Common_btnSearch");
        }

        void ucSitePicker_InitComplete(object sender, EventArgs e)
        {
            RebindTreatmentList();
        }

        void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            RebindTreatmentList();
        }

        private void RebindTreatmentList()
        {
            Globals.IsBusy = true;
            int? siteId = null;
            if (ucSitePicker.SiteId > 0)
            {
                siteId = ucSitePicker.SiteId;
            }
            DataServiceHelper.ListTreatmentAsync(Globals.UserLogin.UserOrganisationId, siteId, null, null, null,
                uiDateFrom.SelectedDate, uiDateTo.SelectedDate, ListTreatmentCompleted);
        }

        void ListTreatmentCompleted(List<Treatment> treatmentList)
        {
            Globals.IsBusy = false;
            ucTreatmentAdmin.BindTreatmentList(treatmentList);
        }
       

    }
}
