﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_commands_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Insert)
        {
            OboutTextBox shipName = (OboutTextBox)(SuperForm1.Rows[1].Cells[1].Controls[0].Controls[0]);
            shipName.Text = "Default Name";

            OboutTextBox shipCity = (OboutTextBox)(SuperForm1.Rows[2].Cells[1].Controls[0].Controls[0]);
            shipCity.Text = "Default City";

            OboutTextBox shipCountry = (OboutTextBox)(SuperForm1.Rows[3].Cells[1].Controls[0].Controls[0]);
            shipCountry.Text = "Default Country";

            OboutTextBox orderDate = (OboutTextBox)(SuperForm1.Rows[4].Cells[1].Controls[0].Controls[0]);
            orderDate.Text = DateTime.Now.ToString("MM/dd/yyyy");

            OboutCheckBox sent = (OboutCheckBox)(SuperForm1.Rows[5].Cells[1].Controls[0]);
            sent.Checked = true;
        }
    }
}
