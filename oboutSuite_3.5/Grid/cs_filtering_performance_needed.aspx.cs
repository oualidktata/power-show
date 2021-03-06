﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_filtering_performance_needed : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceNeeded += Grid1_DataSourceNeeded;
        grid1.AutoGenerateColumns = false;
        grid1.Serialize = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowFiltering = true;
        grid1.AllowGrouping = true;
       
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";
      
        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipAddress";
        oCol4.HeaderText = "SHIP ADDRESS";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";

        Column oCol6 = new Column();
        oCol6.DataField = "ShipCountry";
        oCol6.HeaderText = "SHIP COUNTRY";
      
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }

    protected void Grid1_DataSourceNeeded(object sender, GridDataSourceNeededEventArgs e)
    {
        // Preparing the SQL query for populating the Grid
        string sortExpression = "";
        string filterExpression = "";

        if (string.IsNullOrEmpty(e.SortExpression))
        {
            sortExpression = " ORDER BY OrderID DESC";
        }
        else
        {
            sortExpression = " ORDER BY " + e.SortExpression;
        }

        if (!string.IsNullOrEmpty(e.FilterExpression))
        {
            filterExpression = e.FilterExpression;
        }

        string query = "SELECT TOP " + e.MaximumRows.ToString() + " * FROM (SELECT OrderID, ShipName, ShipCity, ShipAddress, ShipPostalCode, ShipCountry FROM Orders";
        if (e.StartRowIndex != 0)
        {
            query += " WHERE OrderID NOT IN (SELECT TOP " + e.StartRowIndex.ToString() + " OrderID FROM Orders";
            query += (string.IsNullOrEmpty(filterExpression) ? "" : " WHERE " + filterExpression) + sortExpression + ")";
            if (!string.IsNullOrEmpty(filterExpression))
            {
                query += " AND " + filterExpression;
            }
        }
        else
        {
            if (!string.IsNullOrEmpty(filterExpression))
            {
                query += " WHERE " + filterExpression;
            }
        }
        query += sortExpression + ")";

        // Extracting the rows
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        OleDbCommand myComm = new OleDbCommand(query, myConn);
        myConn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");


        string countQuery = "SELECT COUNT(*) FROM Orders";
        if (!string.IsNullOrEmpty(filterExpression))
        {
            countQuery += " WHERE " + filterExpression;
        }

        // Retrieving the total count of rows
        OleDbConnection myConn2 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/Northwind.mdb"));
        OleDbCommand myComm2 = new OleDbCommand(countQuery, myConn2);
        myConn2.Open();
        int count = (int)(myComm2.ExecuteScalar());

        myConn2.Close();

        // Passing the total count to the "TotalRowCount" property of the GridDataSourceNeededEventArgs object
        e.TotalRowCount = count;

        // Populating the grid
        grid1.DataSource = ds.Tables[0];
        grid1.DataBind();
    }
}