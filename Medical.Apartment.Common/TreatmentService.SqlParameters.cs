using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class TreatmentService
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.TreatmentServiceId, NullableRecordId)
                , Utilities.MakeInputParameter(ColumnNames.TreatmentId, TreatmentId)
                , Utilities.MakeInputParameter(ColumnNames.ServiceId, ServiceId)
                , Utilities.MakeInputParameter(ColumnNames.Quantity, Quantity)
                , Utilities.MakeInputParameter(ColumnNames.Price, Price)
                , Utilities.MakeInputParameter(ColumnNames.Description, Description)
                
			};
        }
    }
}
