<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>领域建模工具</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/lib/bootstrap-3.1.1/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/lib/font-awesome-4.0.3/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/umlCanvas.css" />
		<script>
			var contextPath = '<%=request.getContextPath()%>';
		</script>
	</head>
	<body>
		<div class="widget-container" id="widgetContainer">
			<div class="g-head" id="gHead"></div>
			<div class="g-main" id="gMain">
				<div class="col-xs-3 u-left">
					<div class="panel panel-primary" id="projectExplorer">
						<div class="panel-heading">
							项目列表
						</div>
						<div class="panel-body">
							<div id="projectTree" class="tree tree-unselectable"></div>
						</div>
					</div>
					<div class="panel panel-primary" id="propertiesExplorer">
						<div class="panel-heading">
							属性
						</div>
						<div class="panel-body">
							<form class="form-horizontal" id="protertyForm" style="display: none;">
								<div class="form-group">
									<label for="name" class="col-sm-3 control-label">名称:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="name">
									</div>
								</div>
								<div class="form-group">
									<label for="type" class="col-sm-3 control-label">类型:</label>
									<div class="col-sm-9">
										<select class="form-control" id="type">
											<option value="Boolean">Boolean</option>
											<option value="Integer">Integer</option>
											<option value="String">String</option>
											<option value="Date">Date</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="Visibility" class="col-sm-3 control-label">范围:</label>
									<div class="col-sm-9">
										<select class="form-control" id="Visibility">
											<option value="private">private</option>
											<option value="protected">protected</option>
											<option value="public">public</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="description" class="col-sm-3 control-label">备注:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="description">
									</div>
								</div>
							</form>
							<form class="form-horizontal" id="classForm" style="display: none;">
								<div class="form-group">
									<label for="name" class="col-sm-3 control-label">名称:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="name">
									</div>
								</div>
								<div class="form-group">
									<label for="description" class="col-sm-3 control-label">备注:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="description">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-xs-9 u-right">
					<div class="panel panel-primary" id="gwtTabLayoutPanel">
						<div class="panel-heading">
							<ul class="nav nav-tabs" id="navTabs">
								<li class="active">
									<a href="#home" data-toggle="tab">
										主页
									</a>
								</li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content" id="tabContent">
								<div id="home" class="tab-pane active">
									<div class="welcome">
										<h1>欢迎使用领域建模工具</h1>
										<p class="welcome">
											Here is your dashboard, you can <strong>create</strong> a new project or <strong>clone</strong> the examples. Invite your teammates to work (in real-time) on yours models using the share settings.  For any help, write in the
											<a class="gwt-Anchor">
												feedback area
											</a>
											, we gladly help you out. Enjoy collaborative modeling!
										</p>
										<img src="images/koala-domain-model-tool-demo.png" alt="示例图">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="g-footer" id="gFooter">
				Copyright @koala, All rights reserved.
			</div>
		</div>
		<div id="template" style="display: none;">
			<!-- 线条模板 -->
			<svg id="line-template" style="">
				<!-- 继承关系连线模板 -->
				<g class="line extends">
					<path d="M10,20 L80,20" style="marker-end:url(#arrow1)"></path>
					<text x="20" y="30">
						说明文字
					</text>
				</g>
				<!-- 实现关系连线模板 -->
				<g class="line implement">
					<path d="M10,70 L80,70" style="marker-end:url(#arrow1);stroke-dasharray:5"></path>
				</g>
				<!-- 聚合关系连线模板 -->
				<g class="line aggregate">
					<path d="M0,0 L0,0" style="marker-start:url(#arrow2)"></path>
				</g>
				<!-- 组合关系连线模板  -->
				<g class="line compose">
					<path d="M0,0 L0,0" style="marker-start:url(#arrow3)"></path>
				</g>
				<!-- 关联关系连线模板  -->
				<g class="line associate">
					<path d="M0,0 L0,0"></path>
				</g>
			</svg>

			<!-- 节点模板 -->
			<div id="node-template">
				<!-- 实体模板 -->
				<div class="node entity">
					<div class="name">
						Entity
					</div>
					<div class="properties"></div>
					<div class="actions"></div>
				</div>

				<!-- 接口模板 -->
				<div class="node interface">
					<div class="header">
						«interface»
					</div>
					<div class="name">
						Interface
					</div>
					<div class="actions"></div>
				</div>

				<!-- 枚举模板  -->
				<div class="node enum">
					<div class="header">
						«enum»
					</div>
					<div class="name">
						Enum
					</div>
					<div class="enumItems"></div>
				</div>

				<!-- 属性模板  -->
				<div class="property">
					<div class="propertyName">
						property
					</div>
					<div>
						:
					</div>
					<div class="propertyType">
						String
					</div>
				</div>

				<!-- 枚举项模板 -->
				<div class="enumItem">
					ENUMITEM
				</div>

				<!-- 行为模板 -->
				<div class="action">
					<div class="actionName">
						action
					</div>
					<span>(</span>
					<div class="parameters" style="min-width:10px;">
						ssss
					</div>
					<span>) : </span>
					<div class="returnType">
						void
					</div>
				</div>

				<!-- 行为的参数模板 -->
				<div class="parameter" sortNumber="1">
					<div class="parameterType">
						Post
					</div>
					<div class="parameterName">
						post
					</div>
				</div>
			</div>

			<div id="edit_windows">
				<div id="edit_entity_window">

				</div>
			</div>
		</div>
		<!-- 以下内在多个画板时的情况下可以共用 ，包括图形的模板、右键菜单等元素-->
		<!-- uml元素模板 -->
		<svg style="display: none;">
			<defs>
				<!-- 空心三角形 -->
				<marker id="arrow1" markerWidth="100" markerHeight="100" refx="16" refy="13" orient="auto">
					<path d="M10,10 L16,13 L10,16 z" style="fill:#CCFFCC;stroke-dasharray:0;stroke-width:1;"></path>
				</marker>
				<!-- 空心菱形 -->
				<marker id="arrow2" markerWidth="100" markerHeight="100" refx="10" refy="13" orient="auto">
					<path d="M10,13 L16,10 L22,13 L16,16 L10,13 z" style="fill:#CCFFCC;stroke-dasharray:0;stroke-width:1;"></path>
				</marker>
				<!-- 实心菱形 -->
				<marker id="arrow3" markerWidth="100" markerHeight="100" refx="10" refy="13" orient="auto">
					<path d="M10,13 L16,10 L22,13 L16,16 L10,13 z" style="fill:#5890c1;stroke-dasharray:0;stroke-width:1;"></path>
				</marker>
			</defs>
		</svg>
		<!-- 各种右键编辑菜单 -->
		<div id="edit_contextmenus" style="display: none;">
			<!-- 添加节点成员的右键菜单 -->
			<div id="add_members" class="contextmenu">
				<div class="contextmenu_item add_property">
					<div>
						添加属性
					</div>
				</div>
				<div class="contextmenu_item add_action">
					<div>
						添加行为
					</div>
				</div>
				<div class="contextmenu_item add_enumItem">
					<div>
						添加枚举项
					</div>
				</div>
			</div>

			<!--  -->
			<div id="add_nodes" class="contextmenu">
				<div class="contextmenu_item add_entity">
					<div>
						添加实体
					</div>
				</div>
				<div class="contextmenu_item add_interface">
					<div>
						添加接口
					</div>
				</div>
				<div class="contextmenu_item add_enum">
					<div>
						添加枚举
					</div>
				</div>
			</div>
		</div>

		<datalist id="property_type_tip" style="display: none;">
			<option value="String"></option>
			<option value="Set"></option>
			<option value="List"></option>
			<option value="Date"></option>
			<option value="Long"></option>
			<option value="Integer"></option>
		</datalist>
		<script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.0.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/lib/bootstrap-3.1.1/js/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/lib/tiny.tree.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jqueryUmlCanvas.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/tool.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugins/inlineedit/jquery.miniedit.js" ></script>
		<script src="<%=request.getContextPath()%>/js/main.js"></script>
	</body>
</html>