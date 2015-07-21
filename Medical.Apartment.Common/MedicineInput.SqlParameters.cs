using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class MedicineInput
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.MedicineInputId, NullableRecordId)
                , Utilities.MakeInputParameter(ColumnNames.SiteId, SiteId)
                , Utilities.MakeInputParameter(ColumnNames.MedicineId, MedicineId)
				, Utilities.MakeInputParameter(ColumnNames.Date, Date)
                , Utilities.MakeInputParameter(ColumnNames.Description, Description)
                , Utilities.MakeInputParameter(ColumnNames.Quantity, Quantity)                
                , Utilities.MakeInputParameter(ColumnNames.InputPrice, InputPrice)
                , Utilities.MakeInputParameter(ColumnNames.Supplier, Supplier)
			};
        }
    }
}

