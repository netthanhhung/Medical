using System;
using System.Data.SqlClient;

namespace Medical.Apartment.Common
{
    public abstract partial class Record
    {
        public abstract SqlParameter[] SqlParameters();
    }
}
