﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Sales\BookingNew.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "5A75D18426A821C85930FAB15B50DAB9"
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
    
    
    public partial class BookingNew : System.Windows.Controls.UserControl {
        
        internal System.Windows.Controls.Grid uiLayoutRoot;
        
        internal System.Windows.Controls.Grid gridList;
        
        internal System.Windows.Controls.TextBlock uiTitle;
        
        internal System.Windows.Controls.TextBlock lblSite;
        
        internal Medical.Apartment.Silverlight.UI.SitePicker ucSitePicker;
        
        internal System.Windows.Controls.TextBlock lblRoom;
        
        internal System.Windows.Controls.ComboBox uiRoom;
        
        internal System.Windows.Controls.TextBlock lblRoomPrice;
        
        internal Telerik.Windows.Controls.RadNumericUpDown uiRoomPrice;
        
        internal System.Windows.Controls.TextBlock lblDateFrom;
        
        internal Telerik.Windows.Controls.RadDatePicker uiDateFrom;
        
        internal System.Windows.Controls.TextBlock lblDateTo;
        
        internal Telerik.Windows.Controls.RadDatePicker uiDateTo;
        
        internal System.Windows.Controls.TextBlock lblDescription;
        
        internal System.Windows.Controls.TextBox uiDescription;
        
        internal Medical.Apartment.Silverlight.UI.CustomerDetails ucCustomerDetails;
        
        internal Medical.Apartment.Silverlight.UI.CustomerDetails ucCustomerDetails2;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnOK;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnCancel;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Sales/BookingNew.xaml", System.UriKind.Relative));
            this.uiLayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("uiLayoutRoot")));
            this.gridList = ((System.Windows.Controls.Grid)(this.FindName("gridList")));
            this.uiTitle = ((System.Windows.Controls.TextBlock)(this.FindName("uiTitle")));
            this.lblSite = ((System.Windows.Controls.TextBlock)(this.FindName("lblSite")));
            this.ucSitePicker = ((Medical.Apartment.Silverlight.UI.SitePicker)(this.FindName("ucSitePicker")));
            this.lblRoom = ((System.Windows.Controls.TextBlock)(this.FindName("lblRoom")));
            this.uiRoom = ((System.Windows.Controls.ComboBox)(this.FindName("uiRoom")));
            this.lblRoomPrice = ((System.Windows.Controls.TextBlock)(this.FindName("lblRoomPrice")));
            this.uiRoomPrice = ((Telerik.Windows.Controls.RadNumericUpDown)(this.FindName("uiRoomPrice")));
            this.lblDateFrom = ((System.Windows.Controls.TextBlock)(this.FindName("lblDateFrom")));
            this.uiDateFrom = ((Telerik.Windows.Controls.RadDatePicker)(this.FindName("uiDateFrom")));
            this.lblDateTo = ((System.Windows.Controls.TextBlock)(this.FindName("lblDateTo")));
            this.uiDateTo = ((Telerik.Windows.Controls.RadDatePicker)(this.FindName("uiDateTo")));
            this.lblDescription = ((System.Windows.Controls.TextBlock)(this.FindName("lblDescription")));
            this.uiDescription = ((System.Windows.Controls.TextBox)(this.FindName("uiDescription")));
            this.ucCustomerDetails = ((Medical.Apartment.Silverlight.UI.CustomerDetails)(this.FindName("ucCustomerDetails")));
            this.ucCustomerDetails2 = ((Medical.Apartment.Silverlight.UI.CustomerDetails)(this.FindName("ucCustomerDetails2")));
            this.btnOK = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnOK")));
            this.btnCancel = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnCancel")));
        }
    }
}

