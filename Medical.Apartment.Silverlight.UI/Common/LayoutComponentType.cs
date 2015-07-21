using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Medical.Apartment.Silverlight.UI
{
    public enum LayoutComponentType : int
    {
        None = 0,
        RoleAdmin = 1,
        RoleComponentPermission = 2,
        UserRoleAuthorisation = 3,
        SiteAdmin = 4,
        MedicineAdmin = 5,
        ServiceAdmin = 6,
        TreatmentAdmin = 7,
        CustomerAdmin = 8,
        DoctorAdmin = 9,
    }
}
