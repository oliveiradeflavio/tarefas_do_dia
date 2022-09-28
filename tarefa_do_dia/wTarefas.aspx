<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wTarefas.aspx.cs" Inherits="tarefa_do_dia.wTarefas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="~/css/style.css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="~/img/favicon.ico" />

    <title>Criar sua tarefa do dia</title>
</head>
<body>
    <main>
        <section>
             <form id="form_tarefa" runat="server">
                   <div id="container_header">
                       <asp:Label ID="lb_usuario_logado" runat="server"></asp:Label>                                
                       <asp:Button ID="btn_sair" runat="server" Text="Sair" class="btn_sair" OnClick="btn_sair_Click" />
                 
                   </div>
                <div>
                    <asp:TextBox ID="input_tarefa" runat="server" class="caixa_textos" placeholder="qual a tarefa de hoje?"></asp:TextBox>
                    <asp:Button ID="btn_adicionar_tarefa" runat="server" Text="Adicionar Tarefa" class="btn_confirmar" OnClick="btn_adicionar_tarefa_Click" />
                </div>
                 <div class="mensagem_tabela">
                     <asp:Label ID="lb_mensagem_tarefa" runat="server" ></asp:Label>
                 </div>
            <div class="lista_tarefas">
         
                <asp:GridView ID="grid_de_tarefas" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Height="355px" Width="400px" Font-Size="20px" Font-Underline="False" ShowHeader="False" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />                        
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" ShowHeader="False" Visible="False" />
                        <asp:BoundField DataField="tarefa" HeaderText="Tarefa" SortExpression="tarefa" />
                    </Columns>
                    <EditRowStyle BackColor="#cecece" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
        
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tarefas] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tarefas] ([tarefa]) VALUES (@tarefa)" SelectCommand="SELECT [Id], [tarefa] FROM [tarefas]" UpdateCommand="UPDATE [tarefas] SET [tarefa] = @tarefa WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="tarefa" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tarefa" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
               </div>
            </form>
        </section>      
    </main>
   </body>
</html>
