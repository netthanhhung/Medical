﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Administration\SiteAdminPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "CCA524E73B5B6B6598B9332C60E8D438"
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
    
    
    public partial class SiteAdminPage : System.Windows.Controls.Page {
        
        internal System.Windows.Controls.Grid LayoutRootOrgAdmin;
        
        internal System.Windows.Controls.TextBlock uiTitle;
        
        internal System.Windows.Controls.TextBlock uiParamsDisplay;
        
        internal System.Windows.Controls.ScrollViewer scrollViewerSite;
        
        internal Telerik.Windows.Controls.RadGridView gvwSites;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnSaveSite;
        
        internal System.Windows.Controls.Button btnCancelSite;
        
        internal System.Windows.Controls.Grid gridContactAccount;
        
        internal Medical.Apartment.Silverlight.UI.ContactInformationPanel ucCntactInfoPanel;
        
        internal System.Windows.Controls.Grid gridImages;
        
        internal Medical.Apartment.Silverlight.UI.ImageUpload ucImageUpload;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Administration/SiteAdminPage.xaml", System.UriKind.Relative));
            this.LayoutRootOrgAdmin = ((System.Windows.Controls.Grid)(this.FindName("LayoutRootOrgAdmin")));
            this.uiTitle = ((System.Windows.Controls.TextBlock)(this.FindName("uiTitle")));
            this.uiParamsDisplay = ((System.Windows.Controls.TextBlock)(this.FindName("uiParamsDisplay")));
            this.scrollViewerSite = ((System.Windows.Controls.ScrollViewer)(this.FindName("scrollViewerSite")));
            this.gvwSites = ((Telerik.Windows.Controls.RadGridView)(this.FindName("gvwSites")));
            this.btnSaveSite = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnSaveSite")));
            this.btnCancelSite = ((System.Windows.Controls.Button)(this.FindName("btnCancelSite")));
            this.gridContactAccount = ((System.Windows.Controls.Grid)(this.FindName("gridContactAccount")));
            this.ucCntactInfoPanel = ((Medical.Apartment.Silverlight.UI.ContactInformationPanel)(this.FindName("ucCntactInfoPanel")));
            this.gridImages = ((System.Windows.Controls.Grid)(this.FindName("gridImages")));
            this.ucImageUpload = ((Medical.Apartment.Silverlight.UI.ImageUpload)(this.FindName("ucImageUpload")));
        }
    }
}

