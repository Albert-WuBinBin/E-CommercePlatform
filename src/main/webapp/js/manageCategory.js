var dealApply = function() {
	this.btnSearch = $(".btn-search");

	this.table = $("table#table");

	this.initBtnSearch = function() {
		var self = this;
		self.btnSearch.click(function(event) {

			self.table.bootstrapTable('refreshOptions', {
				url : "getCategory",
				pageNumber : 1
			});
		});
	}

	this.initGrid = function() {
		var self = this;
		self.table
				.bootstrapTable('destroy')
				.bootstrapTable(
						{
							type : "get",

							pageNumber : 1,
							pageSize : 10,
							pageList : [ 20, 30, 50, 100 ],
							columns : [ [
									{
										title : '序号',
										field : 'rowno',
										valign : 'middle',
										formatter : function(value, row, index) {
											var options = self.table
													.bootstrapTable('getOptions');
											var pageNumber = options.pageNumber;
											var pageSize = options.pageSize;
											if (pageNumber == 1) {
												return pageSize
														* (pageNumber - 1)
														+ index + 1;
											} else {
												return index + 1;
											}
										}
									},
									{
										title : '类别',
										field : 'name',
										align : 'center'
									},
									{
										title : '操作',
										field : 'operate',
										align : 'center',
										valign : 'middle',
										formatter : function(value, row, index) {

											return [
													'<button id="edit" type="button" class="btn btn-primary" style="margin-right:5px">',
													'<span class="glyphicon glyphicon-edit"></span> 修改',
													'</button>',

													'<button id="remove" type="button" class="btn btn-danger">',
													'<span class="glyphicon glyphicon-remove"></span> 删除',
													'</button>' ].join('');

										},
										events : {

											'click #edit' : function(event,
													value, row, index) {
												var parent = $("#editModal");
												parent.find("#name").val(
														row.name);
												parent.modal("show");
												$(".btn-edit")
														.click(
																function() {

																	var name = parent
																			.find(
																					"#name")
																			.val()
																			.trim();
																	if (name.length <= 0) {
																		alert("名字不能为空");
																		parent
																				.find(
																						"#name")
																				.focus();
																		return false;
																	}

																	$
																			.ajax({
																				type : "post",
																				url : "editCategory",
																				dataType : "json",
																				data : {
																					name : name,
																					id : row.id
																				},
																				success : function(
																						result) {
																					if (result.msg == "修改成功") {
																						alert(result.msg);
																						parent
																								.modal("hide");
																						data = [ {
																							name : name
																						} ];
																						self.table
																								.bootstrapTable(
																										'updateRow',
																										{
																											index : index,
																											row : data[0]
																										});
																					}
																				},
																				error : function(
																						XMLHttpRequest,
																						textStatus,
																						errorThrown) {
																					alert("请求错误："
																							+ XMLHttpRequest.status
																							+ "\nurl:"
																							+ this.url);
																				}
																			});
																});

											},

											'click #remove' : function(event,
													value, row, index) {
												if (confirm("确定删除该名称："
														+ row.name + "?") === true) {
													$
															.ajax({
																type : "post",
																url : "deleteCategory",
																dataType : "json",
																data : {
																	ca_id : row.id
																},
																success : function(
																		result) {
																	if (result.msg == "删除成功") {
																		alert(result.msg);
																		var ids = [];
																		ids
																				.push(row.name);
																		self.table
																				.bootstrapTable(
																						'remove',
																						{
																							field : 'name',
																							values : ids
																						});
																	}

																},
																error : function(
																		XMLHttpRequest,
																		textStatus,
																		errorThrown) {
																	alert("该类别下有商品存在,不能删除");
																	// alert("请求错误："
																	// +
																	// XMLHttpRequest.status
																	// +
																	// "\nurl:"
																	// +
																	// this.url);
																}
															});
												}
											}
										}
									} ] ]
						});
	};
	this.initDocumentEvent = function() {
		var self = this;

		$(".btn-add").click(
				function() {
					var parent = $("#addModal");
					var name = parent.find("#name").val().trim();
					if (name.length <= 0) {
						alert("名字不能为空");
						parent.find("#name").focus();
						return false;
					}
					$.ajax({
						type : "post",
						url : "addCategory",
						dataType : "json",
						data : {
							name : name
						},
						success : function(result) {
							if (result.msg == "success") {
								alert(result.msg);
								parent.modal("hide");
								data = [ {
									name : name
								} ];
								self.table.bootstrapTable('insertRow', {
									index : 0,
									row : data[0]
								});
							}
							else if(result.msg=="exist"){
								alert("该类别名已存在");
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							alert("请求错误：" + XMLHttpRequest.status + "\nurl:"
									+ this.url);
						}
					});
				});

	}

	this.init = function() {

		this.initBtnSearch();
		this.initGrid();
		this.initDocumentEvent();

	};
	this.init();
}

$(function() {
	new dealApply();

});