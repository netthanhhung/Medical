using System;
using System.Runtime.Serialization;
using System.ComponentModel;

namespace Medical.Apartment.Common
{
    [DataContract]
    public partial class TreatmentService : Record
    {
        #region Public Constructors

        public TreatmentService() : base() { }

        #endregion

        #region ColumnNames

        public static class ColumnNames
        {
            public const string TreatmentServiceId = "TreatmentServiceId";
            public const string TreatmentId = "TreatmentId";
            public const string ServiceId = "ServiceId";
            public const string Service = "Service";
            public const string Quantity = "Quantity";
            public const string Price = "Price";
            public const string Description = "Description";
            public const string Unit = "Unit";
            public const string TotalPrice = "TotalPrice";
            public const string BasePrice = "BasePrice";
        }

        #endregion

        #region Properties
        private int _TreatmentServiceId;
        [DataMember]
        public int TreatmentServiceId { get { return _TreatmentServiceId; } set { _TreatmentServiceId = value; RaisePropertyChanged("TreatmentServiceId"); } }

        private int _TreatmentId;
        [DataMember]
        public int TreatmentId { get { return _TreatmentId; } set { if (!this.TreatmentId.Equals(value)) { _TreatmentId = value; RaisePropertyChanged("TreatmentId"); } } }

        private int _ServiceId;
        [DataMember]
        public int ServiceId { get { return _ServiceId; } set { if (!this.ServiceId.Equals(value)) { _ServiceId = value; RaisePropertyChanged("ServiceId"); } } }

        private string _Service;
        [DataMember]
        public string Service { get { return _Service; } set { if (!object.ReferenceEquals(this.Service, value)) { _Service = value; RaisePropertyChanged("Service"); } } }

        private decimal? _quantity;
        [DataMember]
        public decimal? Quantity { get { return _quantity; } set { if (!this.Quantity.Equals(value)) { _quantity = value; RaisePropertyChanged("Quantity"); } } }

        private decimal? _price;
        [DataMember]
        public decimal? Price { get { return _price; } set { if (!this.Price.Equals(value)) { _price = value; RaisePropertyChanged("Price"); } } }

        private decimal? _totalPrice;
        [DataMember]
        public decimal? TotalPrice { get { return _totalPrice; } set { if (!this.TotalPrice.Equals(value)) { _totalPrice = value; RaisePropertyChanged("TotalPrice"); } } }
        
        private decimal? _BasePrice;
        [DataMember]
        public decimal? BasePrice { get { return _BasePrice; } set { if (!this.BasePrice.Equals(value)) { _BasePrice = value; RaisePropertyChanged("BasePrice"); } } }

        private string _unit;
        [DataMember]
        public string Unit { get { return _unit; } set { if (!object.ReferenceEquals(this.Unit, value)) { _unit = value; RaisePropertyChanged("Unit"); } } }

        private string _description;
        [DataMember]
        public string Description { get { return _description; } set { if (!object.ReferenceEquals(this.Description, value)) { _description = value; RaisePropertyChanged("Description"); } } }

        #endregion
    }
}




