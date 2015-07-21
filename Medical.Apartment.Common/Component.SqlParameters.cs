using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class Component
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.ComponentId, NullableRecordId)
				, Utilities.MakeInputParameter(ColumnNames.Name, Name)
			};
        }
    }
}
