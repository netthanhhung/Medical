﻿#pragma checksum "E:\Chanh\Solution\Medical\Medical.Apartment.Silverlight.UI\Controls\ImageUpload.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "696A3099EC1CABC6530D9764A83C904F"
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
    
    
    public partial class ImageUpload : System.Windows.Controls.UserControl {
        
        internal System.Windows.Controls.Grid uiLayoutRoot;
        
        internal System.Windows.Controls.TextBlock lblTitle;
        
        internal System.Windows.Controls.Grid gridList;
        
        internal System.Windows.Controls.ListBox listImages;
        
        internal System.Windows.Controls.Grid gridBtnSave;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnAdd;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnSave;
        
        internal Telerik.Windows.Controls.RadWindow uiPopupUpload;
        
        internal System.Windows.Controls.TextBlock lblPhoto;
        
        internal System.Windows.Controls.TextBox txtFileName;
        
        internal System.Windows.Controls.Button btnChooseImage;
        
        internal System.Windows.Controls.Image imgRoomFigure;
        
        internal Medical.Apartment.Silverlight.UI.SingleClickButton btnUploadOK;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Medical.Apartment.Silverlight.UI;component/Controls/ImageUpload.xaml", System.UriKind.Relative));
            this.uiLayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("uiLayoutRoot")));
            this.lblTitle = ((System.Windows.Controls.TextBlock)(this.FindName("lblTitle")));
            this.gridList = ((System.Windows.Controls.Grid)(this.FindName("gridList")));
            this.listImages = ((System.Windows.Controls.ListBox)(this.FindName("listImages")));
            this.gridBtnSave = ((System.Windows.Controls.Grid)(this.FindName("gridBtnSave")));
            this.btnAdd = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnAdd")));
            this.btnSave = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnSave")));
            this.uiPopupUpload = ((Telerik.Windows.Controls.RadWindow)(this.FindName("uiPopupUpload")));
            this.lblPhoto = ((System.Windows.Controls.TextBlock)(this.FindName("lblPhoto")));
            this.txtFileName = ((System.Windows.Controls.TextBox)(this.FindName("txtFileName")));
            this.btnChooseImage = ((System.Windows.Controls.Button)(this.FindName("btnChooseImage")));
            this.imgRoomFigure = ((System.Windows.Controls.Image)(this.FindName("imgRoomFigure")));
            this.btnUploadOK = ((Medical.Apartment.Silverlight.UI.SingleClickButton)(this.FindName("btnUploadOK")));
        }
    }
}

