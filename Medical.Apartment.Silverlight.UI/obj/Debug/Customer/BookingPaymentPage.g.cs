﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Customer\BookingPaymentPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "BC4350A45E7769DFDA4E10803AF6694A"
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
    
    
    public partial class BookingPaymentPage : System.Windows.Controls.Page {
        
        internal System.Windows.Controls.TextBlock uiTitle;
        
        internal System.Windows.Controls.TextBlock uiParamsDisplay;
        
        internal System.Windows.Controls.TextBlock lblSite;
        
        internal Medical.Apartment.Silverlight.UI.SitePicker ucSitePicker;
        
        internal System.Windows.Controls.TextBlock lblFromDate;
        
        internal Telerik.Windows.Controls.RadDatePicker uiDateFrom;
        
        internal System.Windows.Controls.TextBlock lblToDate;
        
        internal Telerik.Windows.Controls.RadDatePicker uiDateTo;
        
        internal System.Windows.Controls.RadioButton radPaid;
        
        internal System.Windows.Controls.RadioButton radNotPaid;
        
        internal System.Windows.Controls.RadioButton radAll;
        
        internal System.Windows.Controls.Button btnSearch;
        
        internal Telerik.Windows.Controls.RadGridView gvwBookingPayment;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnSavePayment;
        
        internal System.Windows.Controls.Button btnCancelCancel;
        
        internal Telerik.Windows.Controls.RadWindow uiPopupPaymentDetails;
        
        internal Medical.Apartment.Silverlight.UI.BookingPaymentDetails ucPaymentDetails;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Customer/BookingPaymentPage.xaml", System.UriKind.Relative));
            this.uiTitle = ((System.Windows.Controls.TextBlock)(this.FindName("uiTitle")));
            this.uiParamsDisplay = ((System.Windows.Controls.TextBlock)(this.FindName("uiParamsDisplay")));
            this.lblSite = ((System.Windows.Controls.TextBlock)(this.FindName("lblSite")));
            this.ucSitePicker = ((Medical.Apartment.Silverlight.UI.SitePicker)(this.FindName("ucSitePicker")));
            this.lblFromDate = ((System.Windows.Controls.TextBlock)(this.FindName("lblFromDate")));
            this.uiDateFrom = ((Telerik.Windows.Controls.RadDatePicker)(this.FindName("uiDateFrom")));
            this.lblToDate = ((System.Windows.Controls.TextBlock)(this.FindName("lblToDate")));
            this.uiDateTo = ((Telerik.Windows.Controls.RadDatePicker)(this.FindName("uiDateTo")));
            this.radPaid = ((System.Windows.Controls.RadioButton)(this.FindName("radPaid")));
            this.radNotPaid = ((System.Windows.Controls.RadioButton)(this.FindName("radNotPaid")));
            this.radAll = ((System.Windows.Controls.RadioButton)(this.FindName("radAll")));
            this.btnSearch = ((System.Windows.Controls.Button)(this.FindName("btnSearch")));
            this.gvwBookingPayment = ((Telerik.Windows.Controls.RadGridView)(this.FindName("gvwBookingPayment")));
            this.btnSavePayment = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnSavePayment")));
            this.btnCancelCancel = ((System.Windows.Controls.Button)(this.FindName("btnCancelCancel")));
            this.uiPopupPaymentDetails = ((Telerik.Windows.Controls.RadWindow)(this.FindName("uiPopupPaymentDetails")));
            this.ucPaymentDetails = ((Medical.Apartment.Silverlight.UI.BookingPaymentDetails)(this.FindName("ucPaymentDetails")));
        }
    }
}

