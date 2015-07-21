using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class Doctor
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.DoctorId, NullableRecordId)
                , Utilities.MakeInputParameter(ColumnNames.OrganisationId, OrganisationId)
                , Utilities.MakeInputParameter(ColumnNames.SiteId, SiteId)
				, Utilities.MakeInputParameter(ColumnNames.FirstName, FirstName)
				, Utilities.MakeInputParameter(ColumnNames.LastName, LastName)
                , Utilities.MakeInputParameter(ColumnNames.IsLegacy, IsLegacy)
				, Utilities.MakeInputParameter(ColumnNames.Gender, Gender)
                , Utilities.MakeInputParameter(ColumnNames.DoB, DoB)
                , Utilities.MakeInputParameter(ColumnNames.Position, Position)
				, Utilities.MakeInputParameter(ColumnNames.ContactInformationId, ContactInformationId)
				

			};
        }
    }
}
