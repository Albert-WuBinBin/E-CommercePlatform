<%-- 
    Document   : Manage
    Created on : 2016-11-7, 11:26:40
    Author     : AlbertPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <h2>Shop Management</h2>
    <p>Click the buttons on datagrid toolbar to do crud actions.</p>
    
    <table id="dg" title="All Product" class="easyui-datagrid" style="width:700px;height:250px"
            url="getAllProduct"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="id" width="50">ID</th>
                <th field="name" width="50">Name</th>
                <th field="price" width="50">Price</th>
                <th field="stock" width="50">Stock</th>
                <th field="brand" width="50">Brand</th> 
                <th field="image" width="50">Image</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct()">New Product</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">Edit Product</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteProduct()">Remove Product</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">Product Information</div>
            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox" required="true" label="Name:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="price" class="easyui-textbox" required="true" label="Price" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="stock" class="easyui-textbox" required="true" label="Stock" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="brand" class="easyui-textbox" required="true" label="Brand:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="image" type="file" class="easyui-textbox"   label="Image" style="width:100%">
            
                
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveProduct()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
    <div>
    <h1><a href="ManageShop1.jsp">订单管理</a></h1>
    
    </div>
   
    <script type="text/javascript">
        function newProduct(){
        	url='addProduct';
        	$('#dlg').dialog('open').dialog('center').dialog('setTitle','New Product');
            $('#fm').form('clear');    
        }
        function editProduct(){
        	 
        	var row = $('#dg').datagrid('getSelected');
        	url = 'editProduct?id='+row.id;
        	if (row){
        	    $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit Product');
        	    $('#fm').form('load',row);
               
            }
        }
        function saveProduct(){
        	
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.errorMsg){
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function deleteProduct(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','Are you sure you want to destroy this Product?',function(r){
                    if (r){
                        $.post('deleteProduct',{id:row.id},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
    </script>
</body>
</html>


