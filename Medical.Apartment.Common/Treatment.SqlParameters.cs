using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class Treatment
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.TreatmentId, NullableRecordId)
                , Utilities.MakeInputParameter(ColumnNames.SiteId, SiteId)
                , Utilities.MakeInputParameter(ColumnNames.CustomerId, CustomerId)
                , Utilities.MakeInputParameter(ColumnNames.DoctorId, DoctorId)
                , Utilities.MakeInputParameter(ColumnNames.Date, Date)
                , Utilities.MakeInputParameter(ColumnNames.Description, Description)
			};
        }
    }
}
