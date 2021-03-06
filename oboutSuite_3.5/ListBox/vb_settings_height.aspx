﻿<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_settings_height.aspx.vb" Inherits="ListBox_vb_settings_height" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Height</b></span>
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">auto</span>
                
                <br />
                <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
                
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                <span class="tdText">Height="150"</span>
                
                <br />
                <asp:PlaceHolder runat="server" ID="ListBox2Container" /> 
               
            </td>
        </tr>
    </table>       
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The <b>Height</b> property is used to control the height of the drop down menu of the ListBox.<br />
        If the property is not set, the drop down menu will expand to fit all the items in the list (no scrollbars).<br />
        If the property is set, but there are only a few items (less than the specified height), <br />
        no scrollbars will be displayed.
    </span>
</asp:Content>

