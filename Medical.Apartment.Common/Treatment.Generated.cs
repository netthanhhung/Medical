using System;
using System.Runtime.Serialization;
using System.ComponentModel;
using System.Collections.Generic;

namespace Medical.Apartment.Common
{
    [DataContract]
    public partial class Treatment : Record
    {
        #region Public Constructors

        public Treatment() : base() { }

        #endregion

        #region ColumnNames

        public static class ColumnNames
        {
            public const string TreatmentId = "TreatmentId";
            public const string SiteName = "SiteName";
            public const string SiteId = "SiteId";
            public const string CustomerId = "CustomerId";
            public const string CustomerName = "CustomerName";
            public const string DoctorId = "DoctorId";
            public const string DoctorName = "DoctorName";
            public const string Date = "Date";
            public const string Description = "Description";
            public const string TotalPrice = "TotalPrice";
        }
        #endregion

        #region Properties

        private int _TreatmentId;
        [DataMember]
        public int TreatmentId { get { return _TreatmentId; } set { _TreatmentId = value; RaisePropertyChanged("TreatmentId"); } }

        private int _SiteId;
        [DataMember]
        public int SiteId { get { return _SiteId; } set { if (!this.SiteId.Equals(value)) { _SiteId = value; RaisePropertyChanged("SiteId"); } } }

        private string _SiteName;
        [DataMember]
        public string SiteName { get { return _SiteName; } set { if (!object.ReferenceEquals(this.SiteName, value)) { _SiteName = value; RaisePropertyChanged("SiteName"); } } }

        private int _CustomerId;
        [DataMember]
        public int CustomerId { get { return _CustomerId; } set { if (!this.CustomerId.Equals(value)) { _CustomerId = value; RaisePropertyChanged("CustomerId"); } } }

        private string _customerName;
        [DataMember]
        public string CustomerName { get { return _customerName; } set { if (!object.ReferenceEquals(this.CustomerName, value)) { _customerName = value; RaisePropertyChanged("CustomerName"); } } }

        private int _DoctorId;
        [DataMember]
        public int DoctorId { get { return _DoctorId; } set { if (!this.DoctorId.Equals(value)) { _DoctorId = value; RaisePropertyChanged("DoctorId"); } } }

        private string _DoctorName;
        [DataMember]
        public string DoctorName { get { return _DoctorName; } set { if (!object.ReferenceEquals(this.DoctorName, value)) { _DoctorName = value; RaisePropertyChanged("DoctorName"); } } }

        private DateTime _Date;
        [DataMember]
        public DateTime Date { get { return _Date; } set { if (!this.Date.Equals(value)) { _Date = value; RaisePropertyChanged("Date"); } } }

        private string _description;
        [DataMember]
        public string Description { get { return _description; } set { if (!object.ReferenceEquals(this.Description, value)) { _description = value; RaisePropertyChanged("Description"); } } }

        private decimal? _totalPrice;
        [DataMember]
        public decimal? TotalPrice { get { return _totalPrice; } set { if (!this.TotalPrice.Equals(value)) { _totalPrice = value; RaisePropertyChanged("TotalPrice"); } } }

        private List<TreatmentMedicine> _TreatmentMedicines;
        [DataMember]
        public List<TreatmentMedicine> TreatmentMedicines { get { return _TreatmentMedicines; } set { if (!object.ReferenceEquals(this.TreatmentMedicines, value)) { _TreatmentMedicines = value; RaisePropertyChanged("TreatmentMedicines"); } } }

        private List<TreatmentService> _TreatmentServices;
        [DataMember]
        public List<TreatmentService> TreatmentServices { get { return _TreatmentServices; } set { if (!object.ReferenceEquals(this.TreatmentServices, value)) { _TreatmentServices = value; RaisePropertyChanged("TreatmentServices"); } } }


        //private Customer _customerItem;
        //[DataMember]
        //public Customer CustomerItem { get { return _customerItem; } set { if (!object.ReferenceEquals(this.CustomerItem, value)) { _customerItem = value; RaisePropertyChanged("CustomerItem"); } } }

        #endregion
    }
}




