<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    	
	void Page_load(object sender, EventArgs e)
	{
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.EnableRecordHover = true;
        grid1.AllowAddingRecords = false;             

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "400";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "200";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";

      
        // add the columns to the Columns collection of the grid        
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
      

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        	
		if (!Page.IsPostBack)
		{
			CreateGrid();            
		}        
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}				
	</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
			
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Set the Width for the Columns</b></span>		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>Width</b> property of the <b>Column</b> class to set the width of the columns.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>
		
		</form>
	</body>
</html>