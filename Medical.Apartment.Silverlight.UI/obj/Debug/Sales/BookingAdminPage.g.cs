﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Sales\BookingAdminPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "B267E936C346507EFF4D71CA840386D6"
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
    
    
    public partial class BookingAdminPage : System.Windows.Controls.Page {
        
        internal System.Windows.Controls.TextBlock uiTitle;
        
        internal System.Windows.Controls.TextBlock uiParamsDisplay;
        
        internal System.Windows.Controls.ScrollViewer scrollViewerBookings;
        
        internal System.Windows.Controls.TextBlock lblSite;
        
        internal Medical.Apartment.Silverlight.UI.SitePicker ucSitePicker;
        
        internal System.Windows.Controls.TextBlock lblFromDate;
        
        internal Telerik.Windows.Controls.RadDatePicker uiDateFrom;
        
        internal System.Windows.Controls.TextBlock lblToDate;
        
        internal Telerik.Windows.Controls.RadDatePicker uiDateTo;
        
        internal System.Windows.Controls.TextBlock lblCustomer;
        
        internal System.Windows.Controls.TextBox txtCustomer;
        
        internal System.Windows.Controls.TextBlock lblBookingStatus;
        
        internal System.Windows.Controls.CheckBox chkNew;
        
        internal System.Windows.Controls.CheckBox chkProcessing;
        
        internal System.Windows.Controls.CheckBox chkContract;
        
        internal System.Windows.Controls.CheckBox chkCancelled;
        
        internal System.Windows.Controls.Button btnSearch;
        
        internal Medical.Apartment.Silverlight.UI.BookingAdmin ucBookingAdmin;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Sales/BookingAdminPage.xaml", System.UriKind.Relative));
            this.uiTitle = ((System.Windows.Controls.TextBlock)(this.FindName("uiTitle")));
            this.uiParamsDisplay = ((System.Windows.Controls.TextBlock)(this.FindName("uiParamsDisplay")));
            this.scrollViewerBookings = ((System.Windows.Controls.ScrollViewer)(this.FindName("scrollViewerBookings")));
            this.lblSite = ((System.Windows.Controls.TextBlock)(this.FindName("lblSite")));
            this.ucSitePicker = ((Medical.Apartment.Silverlight.UI.SitePicker)(this.FindName("ucSitePicker")));
            this.lblFromDate = ((System.Windows.Controls.TextBlock)(this.FindName("lblFromDate")));
            this.uiDateFrom = ((Telerik.Windows.Controls.RadDatePicker)(this.FindName("uiDateFrom")));
            this.lblToDate = ((System.Windows.Controls.TextBlock)(this.FindName("lblToDate")));
            this.uiDateTo = ((Telerik.Windows.Controls.RadDatePicker)(this.FindName("uiDateTo")));
            this.lblCustomer = ((System.Windows.Controls.TextBlock)(this.FindName("lblCustomer")));
            this.txtCustomer = ((System.Windows.Controls.TextBox)(this.FindName("txtCustomer")));
            this.lblBookingStatus = ((System.Windows.Controls.TextBlock)(this.FindName("lblBookingStatus")));
            this.chkNew = ((System.Windows.Controls.CheckBox)(this.FindName("chkNew")));
            this.chkProcessing = ((System.Windows.Controls.CheckBox)(this.FindName("chkProcessing")));
            this.chkContract = ((System.Windows.Controls.CheckBox)(this.FindName("chkContract")));
            this.chkCancelled = ((System.Windows.Controls.CheckBox)(this.FindName("chkCancelled")));
            this.btnSearch = ((System.Windows.Controls.Button)(this.FindName("btnSearch")));
            this.ucBookingAdmin = ((Medical.Apartment.Silverlight.UI.BookingAdmin)(this.FindName("ucBookingAdmin")));
        }
    }
}

