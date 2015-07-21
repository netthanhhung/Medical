using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public partial class UserRoleAuth
    {
        public override SqlParameter[] SqlParameters()
        {
            return new SqlParameter[]
			{
				Utilities.MakeInputOutputParameter(ColumnNames.UserRoleAuthId, NullableRecordId)
				, Utilities.MakeInputParameter(ColumnNames.UserId, UserId)
				, Utilities.MakeInputParameter(ColumnNames.RoleId, RoleId)
				, Utilities.MakeInputParameter(ColumnNames.WholeOrg, WholeOrg)
				, Utilities.MakeInputParameter(ColumnNames.SiteId, SiteId)
			};
        }
    }
}
