using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class TreatmentMedicine
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.TreatmentMedicineId, NullableRecordId)
                , Utilities.MakeInputParameter(ColumnNames.TreatmentId, TreatmentId)
                , Utilities.MakeInputParameter(ColumnNames.MedicineId, MedicineId)
                , Utilities.MakeInputParameter(ColumnNames.Quantity, Quantity)
                , Utilities.MakeInputParameter(ColumnNames.Price, Price)
                , Utilities.MakeInputParameter(ColumnNames.Description, Description)
                
			};
        }
    }
}
