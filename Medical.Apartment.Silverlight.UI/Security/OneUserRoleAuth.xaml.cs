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
using System.Windows.Browser;
using Telerik.Windows.Input;
using Telerik.Windows.Controls;
using Medical.Apartment.Common;

namespace Medical.Apartment.Silverlight.UI
{
    public partial class OneUserRoleAuth : UserControl
    {
        /*  ======================================================================            
         *      EVENTS AND DELEGATES
         *  ====================================================================== */
        public event EventHandler DeleteButtonClicked;
        public List<AspUser> AspUsers { get; set; }
        public List<AspRole> AspRoles { get; set; }
        public UserRoleAuth UserRoleAuthData { get; set; }
        public bool IsUserView { get; set; }
        public bool IsFirstLoad { get; set; }
        public string ValidationMessage { get; set; }

        public OneUserRoleAuth()
        {
            InitializeComponent();
            btnDelete.Click += new RoutedEventHandler(btnDelete_Click);
        }

        void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (DeleteButtonClicked != null)
                DeleteButtonClicked(this, null);
        }

        public void RebindCombobox()
        {
            IsFirstLoad = true;
            Globals.IsBusy = true;
            if (this.IsUserView)
            {
                uiRoles.DisplayMemberPath = "RoleName";
                uiRoles.SelectedValuePath = "RoleId";
                uiRoles.ItemsSource = this.AspRoles;
                if (this.UserRoleAuthData != null && this.AspRoles != null && this.UserRoleAuthData.RoleId != Guid.Empty)
                {
                    if (this.AspRoles.Count(i => i.RoleId == this.UserRoleAuthData.RoleId) > 0)
                    {
                        uiRoles.SelectedValue = this.UserRoleAuthData.RoleId;
                        uiRoles.Visibility = System.Windows.Visibility.Visible;
                        txtRoleName.Visibility = System.Windows.Visibility.Collapsed;
                        this.IsEnabled = true;
                    }
                    else
                    {
                        //uiRoles.SelectedIndex = 0;
                        txtRoleName.Text = this.UserRoleAuthData.RoleName;
                        uiRoles.Visibility = System.Windows.Visibility.Collapsed;
                        txtRoleName.Visibility = System.Windows.Visibility.Visible;
                        this.IsEnabled = false;
                    }
                }
                else
                {
                    uiRoles.SelectedIndex = 0;
                    uiRoles.Visibility = System.Windows.Visibility.Visible;
                    txtRoleName.Visibility = System.Windows.Visibility.Collapsed;
                    this.IsEnabled = true;
                }
            }
            else
            {
                uiRoles.DisplayMemberPath = "DisplayName";
                uiRoles.SelectedValuePath = "UserId";
                uiRoles.ItemsSource = this.AspUsers;
                if (this.UserRoleAuthData != null && this.AspUsers != null
                    && this.AspUsers.Count(i => i.UserId == this.UserRoleAuthData.UserId) > 0)
                {
                    uiRoles.SelectedValue = this.UserRoleAuthData.UserId;
                }
                else
                {
                    uiRoles.SelectedIndex = 0;
                }
            }

            CheckSiteGroupLevelSecurity();


            if (this.UserRoleAuthData != null)
            {
                chkWholeOrg.IsChecked = this.UserRoleAuthData.WholeOrg == true;
            }

            if (!this.UserRoleAuthData.SiteId.HasValue)
            {
                Globals.IsBusy = false;
                IsFirstLoad = false;
            }

        }

        void CheckSiteGroupLevelSecurity()
        {
            var auths = Globals.UserLogin.UserRoleAuths.Where(i => i.RoleId == SecurityHelper.SecurityAdminRoleId);
            if (auths.Count(i => i.WholeOrg == true) > 0)
            {
                chkWholeOrg.IsEnabled = true;
            }
            else
            {
                chkWholeOrg.IsEnabled = false;                
            }
        }

        List<Site> CheckSiteLevelSecurity(List<Site> siteList)
        {
            var auths = Globals.UserLogin.UserRoleAuths.Where(i => i.RoleId == SecurityHelper.SecurityAdminRoleId);
            if (auths.Count(i => !i.SiteId.HasValue) > 0)
            {
                uiSites.IsEnabled = true;
            }
            else
            {
                siteList = (from s in siteList
                            join n in auths on s.SiteId equals n.SiteId
                            select s).Distinct().ToList();
                uiSites.IsEnabled = siteList.Count > 1;
            }
            return siteList;
        }

        public void PrepareSaveData()
        {            
            if (this.UserRoleAuthData == null)
            {
                this.UserRoleAuthData = new UserRoleAuth();                
            }
            if(!this.UserRoleAuthData.NullableRecordId.HasValue)
                this.UserRoleAuthData.CreatedBy = Globals.UserLogin.UserName;
            this.UserRoleAuthData.UpdatedBy = Globals.UserLogin.UserName;

            if(this.IsUserView)
                this.UserRoleAuthData.RoleId = Guid.Parse(uiRoles.SelectedValue.ToString());
            else
                this.UserRoleAuthData.UserId = Guid.Parse(uiRoles.SelectedValue.ToString());

            this.UserRoleAuthData.WholeOrg = chkWholeOrg.IsChecked;

            if (uiSites.SelectedValue != null && Convert.ToInt32(uiSites.SelectedValue) > 0)
                this.UserRoleAuthData.SiteId = Convert.ToInt32(uiSites.SelectedValue);
            else
                this.UserRoleAuthData.SiteId = null;

            this.UserRoleAuthData.IsChanged = true;

            //Check validation :
            ValidationMessage = string.Empty;
            
        }
    }
}
