using System;
using System.Runtime.Serialization;
using System.ComponentModel;

namespace Medical.Apartment.Common
{
    [DataContract]
    public partial class MedicineInput : Record
    {
        #region Public Constructors

        public MedicineInput() : base() { }

        #endregion

        #region ColumnNames

        public static class ColumnNames
        {
            public const string MedicineInputId = "MedicineInputId";
            public const string SiteId = "SiteId";
            public const string MedicineId = "MedicineId";
            public const string Name = "Name";
            public const string Date = "Date";
            public const string Quantity = "Quantity";
            public const string Description = "Description";            
            public const string InputPrice = "InputPrice";
            public const string Supplier = "Supplier";          
        }

        #endregion

        #region Properties

        private int _MedicineInputId;
        [DataMember]
        public int MedicineInputId { get { return _MedicineInputId; } set { _MedicineInputId = value; RaisePropertyChanged("MedicineInputId"); } }

        private int _SiteId;
        [DataMember]
        public int SiteId { get { return _SiteId; } set { if (!this.SiteId.Equals(value)) { _SiteId = value; RaisePropertyChanged("SiteId"); } } }

        private int _MedicineId;
        [DataMember]
        public int MedicineId { get { return _MedicineId; } set { if (!this.MedicineId.Equals(value)) { _MedicineId = value; RaisePropertyChanged("MedicineId"); } } }

        private string _Name;
        [DataMember]
        public string Name { get { return _Name; } set { if (!object.ReferenceEquals(this.Name, value)) { _Name = value; RaisePropertyChanged("Name"); } } }

        private DateTime _Date;
        [DataMember]
        public DateTime Date { get { return _Date; } set { if (!this.Date.Equals(value)) { _Date = value; RaisePropertyChanged("Date"); } } }

        private string _description;
        [DataMember]
        public string Description { get { return _description; } set { if (!object.ReferenceEquals(this.Description, value)) { _description = value; RaisePropertyChanged("Description"); } } }

        private decimal? _quantity;
        [DataMember]
        public decimal? Quantity { get { return _quantity; } set { if (!this.Quantity.Equals(value)) { _quantity = value; RaisePropertyChanged("Quantity"); } } }

        private decimal? _InputPrice;
        [DataMember]
        public decimal? InputPrice { get { return _InputPrice; } set { if (!this.InputPrice.Equals(value)) { _InputPrice = value; RaisePropertyChanged("InputPrice"); } } }

        private string _Supplier;
        [DataMember]
        public string Supplier { get { return _Supplier; } set { if (!object.ReferenceEquals(this.Supplier, value)) { _Supplier = value; RaisePropertyChanged("Supplier"); } } }

        #endregion
    }
}




