﻿<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_fields_autogenerate.aspx.vb" Inherits="SuperForm_vb_fields_autogenerate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Auto Generate Fields</b></span>
    
    <br /><br />
    
   <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID AS [Order ID], ShipName AS [Ship Name], ShipCity AS [Ship City], ShipRegion AS [Ship Region], ShipCountry AS [Ship Country], ShipPostalCode AS [Ship Postal Code], 
                        OrderDate AS [Order Date], ShippedDate AS [Shipped Date], RequiredDate AS [Required Date], Sent FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry, 
                       ShipPostalCode=@ShipPostalCode, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, OrderDate, ShippedDate, RequiredDate, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipCountry, @ShipPostalCode, @OrderDate, @ShippedDate, @RequiredDate, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The Super Form can generate its fields automatically from the fields of the data source.<br />
        To enable this feature, simply set the <b>AutoGenerateRows</b> property to <span class="option2">true</span>.<br /><br />
        Besides generating all the fields automatically, the Super Form detects the type of each field from the data source<br />
        and generates apropriate fields. For example, for:<br />
        <ul>
            <li><b>Boolean</b> fields, the Super Form will generate fields of type <b>CheckBoxField</b></li>
            <li><b>DateTime</b> fields, the Super Form will generate fields of type <b>DateField</b></li>
        </ul><br />

        The primary key field (designated using the <b>DataKeyNames</b> property) will be read only in edit mode and hidden in add mode.
    </span>
</asp:Content>

