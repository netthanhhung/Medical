using System;
using System.Runtime.Serialization;
using System.ComponentModel;

namespace Medical.Apartment.Common
{
    [DataContract]
    public partial class Doctor : Record
    {
        #region Public Constructors

        public Doctor() : base() { }

        #endregion

        #region ColumnNames

        public static class ColumnNames
        {
            public const string DoctorId = "DoctorId";
            public const string OrganisationId = "OrganisationID";
            public const string SiteName = "SiteName";
            public const string SiteId = "SiteId";
            public const string FirstName = "FirstName";
            public const string LastName = "LastName";
            public const string IsLegacy = "IsLegacy";
            public const string Gender = "Gender";            
            public const string DoB = "DoB";
            public const string Position = "Position";
            public const string ContactInformationId = "ContactInformationId";
        }

        #endregion

        #region Properties

        [DataMember]
        public int DoctorId { get { return Utilities.ToInt(RecordId); } set { RecordId = value; RaisePropertyChanged("DoctorId"); } }

        private int _organisationId;
        [DataMember]
        public int OrganisationId { get { return _organisationId; } set { if (!this.OrganisationId.Equals(value)) { _organisationId = value; RaisePropertyChanged("OrganisationId"); } } }

        private int _SiteId;
        [DataMember]
        public int SiteId { get { return _SiteId; } set { if (!this.SiteId.Equals(value)) { _SiteId = value; RaisePropertyChanged("SiteId"); } } }

        private string _SiteName;
        [DataMember]
        public string SiteName { get { return _SiteName; } set { if (!object.ReferenceEquals(this.SiteName, value)) { _SiteName = value; RaisePropertyChanged("SiteName"); } } }

        private string _firstName;
        [DataMember]
        public string FirstName { get { return _firstName; } set { if (!object.ReferenceEquals(this.FirstName, value)) { _firstName = value; RaisePropertyChanged("FirstName"); } } }

        private string _lastName;
        [DataMember]
        public string LastName { get { return _lastName; } set { if (!object.ReferenceEquals(this.LastName, value)) { _lastName = value; RaisePropertyChanged("LastName"); } } }

        private bool _isLegacy;
        [DataMember]
        public bool IsLegacy { get { return _isLegacy; } set { if (!this.IsLegacy.Equals(value)) { _isLegacy = value; RaisePropertyChanged("IsLegacy"); } } }

        private int? _gender;
        [DataMember]
        public int? Gender { get { return _gender; } set { if (!object.ReferenceEquals(this.Gender, value)) { _gender = value; RaisePropertyChanged("Gender"); } } }

        private DateTime? _DoB;
        [DataMember]
        public DateTime? DoB { get { return _DoB; } set { if (!object.ReferenceEquals(this.DoB, value)) { _DoB = value; RaisePropertyChanged("DoB"); } } }

        private string _Position;
        [DataMember]
        public string Position { get { return _Position; } set { if (!object.ReferenceEquals(this.Position, value)) { _Position = value; RaisePropertyChanged("Position"); } } }

        private int? _contactInformationId;
        [DataMember]
        public int? ContactInformationId { get { return _contactInformationId; } set { if (!object.ReferenceEquals(this.ContactInformationId, value)) { _contactInformationId = value; RaisePropertyChanged("ContactInformationId"); } } }


        private ContactInformation _contactInformation;
        [DataMember]
        public ContactInformation ContactInformation { get { return _contactInformation; } set { if (!object.ReferenceEquals(this.ContactInformation, value)) { _contactInformation = value; RaisePropertyChanged("ContactInformation"); } } }

        [DataMember]
        public string FullName
        {
            get { return this.FirstName + " " + this.LastName; }
            set { }
        }


        #endregion

    }
}
