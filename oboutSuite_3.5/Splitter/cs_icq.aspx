<%@ Page Language="C#" Inherits="cs_icq" Src="cs_icq.aspx.cs" %>
<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Splitter examples</title>
		<style type="text/css">
            .tdText {
                font:11px Verdana;
                color:#333333;
            }
			body
			{
				font-family:Verdana;
			}
			.text
			{
				background-color:#d6e5fd;
				font-size:11px;
				text-align:center;
			}
			.textContent
			{
				font-size:11px;
				text-align:center;
			}
		</style>
	</head>
	 <body>
        <form id="Form1" runat="server">
            <br />
	        <span class="tdText"><b>ASP.NET Splitter - HideBeforeLoad - Icq</b></span>
    	
	        <br /><br />
            <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">� Back to examples</a>
            <br /><br />
			<obspl:Splitter id="sp1" runat="server">
				<LeftPanel>
					<Header>
						<div style="width:100%;height:100%;" class="text">
							<br />
						</div>
					</Header>
					<Content>
						<div style="width:100%;height:100%;" class="textContent">
							<br />
							<br />
							<br />
							left content
						</div>
					</Content>
					<Footer>
						<div style="width:100%;height:100%;" class="text">
							<br />
							optional left footer
						</div>
					</Footer>
				</LeftPanel>
				<RightPanel>
					<Header>
						<div style="width:100%;height:100%;" class="text">
							<br />
							optional right header
						</div>
					</Header>
					<Content>
						<div style="width:100%;height:100%;" class="textContent">
							<br />
							<br />
							<br />
							right content
						</div>
					</Content>
					<Footer>
						<div style="width:100%;height:100%;" class="text">
							<br />
							optional right footer
						</div>
					</Footer>
				</RightPanel>
			</obspl:Splitter>
		</form>
	</body>
</html>
