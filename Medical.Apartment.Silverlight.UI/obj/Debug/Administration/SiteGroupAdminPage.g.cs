﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Administration\SiteGroupAdminPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "1D7BDFCEFF006650E6BC6DCEA58D0C00"
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
using Telerik.Windows.Controls;


namespace Medical.Apartment.Silverlight.UI {
    
    
    public partial class SiteGroupAdminPage : System.Windows.Controls.Page {
        
        internal System.Windows.Controls.Grid LayoutRootOrgAdmin;
        
        internal System.Windows.Controls.TextBlock uiTitle;
        
        internal System.Windows.Controls.TextBlock uiParamsDisplay;
        
        internal Medical.Apartment.Silverlight.UI.ClippedGrid layoutContent;
        
        internal System.Windows.Controls.ScrollViewer scrollViewerRateGroup;
        
        internal Telerik.Windows.Controls.RadGridView gvwSiteGroup;
        
        internal Telerik.Windows.Controls.RadGridView gvwSites;
        
        internal Medical.Apartment.Silverlight.UI.SitePicker ucSitePicker;
        
        internal System.Windows.Controls.Button btnAddSite;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnSave;
        
        internal System.Windows.Controls.Button btnCancel;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Administration/SiteGroupAdminPage.xam" +
                        "l", System.UriKind.Relative));
            this.LayoutRootOrgAdmin = ((System.Windows.Controls.Grid)(this.FindName("LayoutRootOrgAdmin")));
            this.uiTitle = ((System.Windows.Controls.TextBlock)(this.FindName("uiTitle")));
            this.uiParamsDisplay = ((System.Windows.Controls.TextBlock)(this.FindName("uiParamsDisplay")));
            this.layoutContent = ((Medical.Apartment.Silverlight.UI.ClippedGrid)(this.FindName("layoutContent")));
            this.scrollViewerRateGroup = ((System.Windows.Controls.ScrollViewer)(this.FindName("scrollViewerRateGroup")));
            this.gvwSiteGroup = ((Telerik.Windows.Controls.RadGridView)(this.FindName("gvwSiteGroup")));
            this.gvwSites = ((Telerik.Windows.Controls.RadGridView)(this.FindName("gvwSites")));
            this.ucSitePicker = ((Medical.Apartment.Silverlight.UI.SitePicker)(this.FindName("ucSitePicker")));
            this.btnAddSite = ((System.Windows.Controls.Button)(this.FindName("btnAddSite")));
            this.btnSave = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnSave")));
            this.btnCancel = ((System.Windows.Controls.Button)(this.FindName("btnCancel")));
        }
    }
}

