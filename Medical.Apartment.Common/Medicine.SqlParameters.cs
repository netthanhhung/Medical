using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class Medicine
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.MedicineId, NullableRecordId)
                , Utilities.MakeInputParameter(ColumnNames.OrganisationId, OrganisationId)
				, Utilities.MakeInputParameter(ColumnNames.Name, Name)
                , Utilities.MakeInputParameter(ColumnNames.Description, Description)
                , Utilities.MakeInputParameter(ColumnNames.IsLegacy, IsLegacy)
                , Utilities.MakeInputParameter(ColumnNames.Price, Price)
                , Utilities.MakeInputParameter(ColumnNames.InputPrice, InputPrice)
                , Utilities.MakeInputParameter(ColumnNames.Unit, Unit)
			};
        }
    }
}

