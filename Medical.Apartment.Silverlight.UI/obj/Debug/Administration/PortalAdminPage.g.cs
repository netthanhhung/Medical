﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Administration\PortalAdminPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "2092D5D78B042AE98669A9A6DE049F50"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34011
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Medical.Apartment.Silverlight.UI;
using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace Medical.Apartment.Silverlight.UI {
    
    
    public partial class PortalAdminPage : System.Windows.Controls.Page {
        
        internal System.Windows.Controls.Grid LayoutRootOrgAdmin;
        
        internal System.Windows.Controls.TextBlock uiTitle;
        
        internal System.Windows.Controls.TextBlock uiParamsDisplay;
        
        internal System.Windows.Controls.ScrollViewer scrollViewerOrganisation;
        
        internal Telerik.Windows.Controls.RadGridView gvwOrganisations;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnSaveOrg;
        
        internal System.Windows.Controls.Button btnCancelOrg;
        
        internal System.Windows.Controls.Grid gridContactAccount;
        
        internal Medical.Apartment.Silverlight.UI.ContactInformationPanel ucCntactInfoPanel;
        
        internal System.Windows.Controls.TextBlock txtAccountInfo;
        
        internal Medical.Apartment.Silverlight.UI.UserAccount ucUserAccount;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Administration/PortalAdminPage.xaml", System.UriKind.Relative));
            this.LayoutRootOrgAdmin = ((System.Windows.Controls.Grid)(this.FindName("LayoutRootOrgAdmin")));
            this.uiTitle = ((System.Windows.Controls.TextBlock)(this.FindName("uiTitle")));
            this.uiParamsDisplay = ((System.Windows.Controls.TextBlock)(this.FindName("uiParamsDisplay")));
            this.scrollViewerOrganisation = ((System.Windows.Controls.ScrollViewer)(this.FindName("scrollViewerOrganisation")));
            this.gvwOrganisations = ((Telerik.Windows.Controls.RadGridView)(this.FindName("gvwOrganisations")));
            this.btnSaveOrg = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnSaveOrg")));
            this.btnCancelOrg = ((System.Windows.Controls.Button)(this.FindName("btnCancelOrg")));
            this.gridContactAccount = ((System.Windows.Controls.Grid)(this.FindName("gridContactAccount")));
            this.ucCntactInfoPanel = ((Medical.Apartment.Silverlight.UI.ContactInformationPanel)(this.FindName("ucCntactInfoPanel")));
            this.txtAccountInfo = ((System.Windows.Controls.TextBlock)(this.FindName("txtAccountInfo")));
            this.ucUserAccount = ((Medical.Apartment.Silverlight.UI.UserAccount)(this.FindName("ucUserAccount")));
        }
    }
}

