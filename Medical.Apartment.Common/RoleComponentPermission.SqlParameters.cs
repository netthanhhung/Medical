using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class RoleComponentPermission
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.RoleComponentPermissionId, NullableRecordId)
				, Utilities.MakeInputParameter(ColumnNames.RoleId, RoleId)
				, Utilities.MakeInputParameter(ColumnNames.ComponentId, ComponentId)
				, Utilities.MakeInputParameter(ColumnNames.WriteRight, WriteRight)

			};
        }
    }
}
