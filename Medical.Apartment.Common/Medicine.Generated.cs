using System;
using System.Runtime.Serialization;
using System.ComponentModel;

namespace Medical.Apartment.Common
{
    [DataContract]
    public partial class Medicine : Record
    {
        #region Public Constructors

        public Medicine() : base() { }

        #endregion

        #region ColumnNames

        public static class ColumnNames
        {
            public const string MedicineId = "MedicineId";
            public const string OrganisationId = "OrganisationID";
            public const string Name = "Name";
            public const string Description = "Description";
            public const string IsLegacy = "IsLegacy";
            public const string Price = "Price";
            public const string InputPrice = "InputPrice";
            public const string Unit = "Unit";

            public const string Quantity = "Quantity";
            public const string SoldQuantity = "SoldQuantity";
            public const string BeginPeriodQuantity = "BeginPeriodQuantity";   
        }

        #endregion

        #region Properties

        private int _MedicineId;
        [DataMember]
        public int MedicineId { get { return _MedicineId; } set { _MedicineId = value; RaisePropertyChanged("MedicineId"); } }

        private int _organisationId;
        [DataMember]
        public int OrganisationId { get { return _organisationId; } set { if (!this.OrganisationId.Equals(value)) { _organisationId = value; RaisePropertyChanged("OrganisationId"); } } }

        private string _Name;
        [DataMember]
        public string Name { get { return _Name; } set { if (!object.ReferenceEquals(this.Name, value)) { _Name = value; RaisePropertyChanged("Name"); } } }

        private string _description;
        [DataMember]
        public string Description { get { return _description; } set { if (!object.ReferenceEquals(this.Description, value)) { _description = value; RaisePropertyChanged("Description"); } } }

        private bool _isLegacy;
        [DataMember]
        public bool IsLegacy { get { return _isLegacy; } set { if (!this.IsLegacy.Equals(value)) { _isLegacy = value; RaisePropertyChanged("IsLegacy"); } } }

        private decimal? _Price;
        [DataMember]
        public decimal? Price { get { return _Price; } set { if (!this.Price.Equals(value)) { _Price = value; RaisePropertyChanged("Price"); } } }

        private decimal? _InputPrice;
        [DataMember]
        public decimal? InputPrice { get { return _InputPrice; } set { if (!this.InputPrice.Equals(value)) { _InputPrice = value; RaisePropertyChanged("InputPrice"); } } }

        private string _unit;
        [DataMember]
        public string Unit { get { return _unit; } set { if (!object.ReferenceEquals(this.Unit, value)) { _unit = value; RaisePropertyChanged("Unit"); } } }

        private decimal? _quantity;
        [DataMember]
        public decimal? Quantity { get { return _quantity; } set { if (!this.Quantity.Equals(value)) { _quantity = value; RaisePropertyChanged("Quantity"); } } }

        private decimal? _soldQuantity;
        [DataMember]
        public decimal? SoldQuantity { get { return _soldQuantity; } set { if (!this.SoldQuantity.Equals(value)) { _soldQuantity = value; RaisePropertyChanged("SoldQuantity"); } } }

        private decimal? _beginPeriodQuantity;
        [DataMember]
        public decimal? BeginPeriodQuantity { get { return _beginPeriodQuantity; } set { if (!this.BeginPeriodQuantity.Equals(value)) { _beginPeriodQuantity = value; RaisePropertyChanged("BeginPeriodQuantity"); } } }

        #endregion
    }
}




