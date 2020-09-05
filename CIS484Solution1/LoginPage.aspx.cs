using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CIS484Solution1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void menuTabsCurrent_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu menuTabsCurrent = sender as Menu;
            MultiView multiTabs = this.FindControl("multiviewEmployee") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(menuTabsCurrent.SelectedValue);

        }
        protected void MasterMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu MasterMenu = sender as Menu;
            MultiView multiTabs = this.FindControl("MasterMultiView") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(MasterMenu.SelectedValue);

        }
        protected void TeacherMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu TeacherMenu = sender as Menu;
            MultiView multiTabs = this.FindControl("TeacherView") as MultiView;
            multiTabs.ActiveViewIndex = Int32.Parse(TeacherMenu.SelectedValue);

        }
    }
}