<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
 <!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 图片插件 -->
    <link href="static/js/fancybox/jquery.fancybox.css" rel="stylesheet">
    <!-- Check Box -->
    <link href="static/js/iCheck/custom.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="static/js/sweetalert/sweetalert.css" rel="stylesheet">
    <!-- 日期控件-->
<script src="static/js/layer/laydate/laydate.js"></script>
	<title>${pd.SYSNAME}</title>
</head>

<body class="gray-bg position-relative" ><!-- position-relative -->
	<!-- 合同变更 -->
	<div id="ChangeIncontractHTML" class="animated fadeIn"></div>
    <div class="wrapper wrapper-content">
        <div class="row">
        <form role="form" action="contractNew/${msg}.do" method="post" name="ContractNewForm" id="ContractNewForm">
			<input type="hidden" name="item_id" id="item_id" value="${pd.item_id}" /> 	
			<input type="hidden" name="HT_NO" id="HT_NO" value="${pd.HT_NO}" /> 
			<input type="hidden" name="offer_id" id="offer_id" value="${pd.offer_id}" /> 	
			<input type="hidden" name="DTNUM" id="DTNUM" value="${pd.DT_NUM}" /> 
			<input type="hidden" name="TOTAL" id="TOTAL" value="${pd.TOTAL}" /> 
			<input type="hidden" name="jsonDt" id="jsonDt" value="${pd.jsonDt}" /> 
			<input type="hidden" name="jsonFkfs" id="jsonFkfs" value="${pd.jsonFkfs}" />   
			<input type="hidden" name="HT_UUID" id="HT_UUID" value="${pd.HT_UUID}" />   
			<input type="hidden" name="PRICE" id="PRICE" value="${pd.PRICE}" />
			<input type="hidden" name="HT_FJSC_JSON" id="HT_FJSC_JSON" value="${pd.HT_FJSC_JSON}">
			<input type="hidden" name="address_id" value="${pd.address_id}">
			<input type="hidden" name="type" id="type" value="" />
			<input type="hidden" name="CONTRACT_ATTA_JSON" id="CONTRACT_ATTA_JSON" value="${pd.CONTRACT_ATTA_JSON}">
			<input type="hidden" id="sale_type" value="${pd.sale_type}">
			
        	<div class="panel blank-panel">
	        	<!-- 头部  Start-->
				<div style="padding-bottom:40px;">
				  <div class="form-group form-inline">
				     <label style="margin-top: 15px; margin-left: 20px; width: 8%">合同编号:</label>
					 <label style="width: 22%">${pd.HT_NO}</label> 
					 <!-- 查看进来时不显示 -->
					 <c:if test="${msg !='view' }">
					    <button class="btn btn-sm btn-primary" style="margin-left:36%;
					    height:31px" title="保存" type="button" onclick="save('BC');">保存</button>
					    
					    <button class="btn btn-sm btn-success" style="margin-left:8px;
					  height:31px" title="提交" type="button" onclick="save('TJ');">提交 </button>
					 </c:if>
					 <c:if test="${CNUpdate=='1' && msg =='view'   }">
					 	<button class="btn btn-sm btn-primary" style="margin-left:36%;
					    height:31px" title="保存" type="button" onclick="saveHtFile();">保存合同附件</button>
					 </c:if>
					 
				    <% // <button class="btn btn-sm" title="预览" style="background:#999999;color:white;margin-left:8px;
				      //height:31px" type="button" onclick="CNprview();">预览</button>%>
				     
				     <button class="btn btn-sm btn-warning" title="报价信息" style="margin-left:8px;
					  height:31px" type="button" onclick="CNquoteInformation('${pd.HT_OFFER_ID}','${pd.HT_ITEM_ID}');">报价信息</button>
					 
					 <c:if test="${pd.ACT_STATUS == '4'}"> 
					   <button class="btn btn-sm btn-warning" title="变更协议" style="margin-left:8px;
					   height:31px" type="button" onclick="CNBGXY('${pd.HT_UUID}','${pd.item_id}');">变更协议</button>
					 </c:if>
					 
				  </div>
	          	</div>
				<!-- 头部  End-->
        		
        		<!-- Tab Start -->
				<div class="panel-heading" style="margin-top: -40px;">
					<div class="panel-options">
						<ul class="nav nav-tabs">
							<li id="nav-tab-1">
								<a class="count-info-sm" data-toggle="tab" onclick="CutOverTab(1)">
									<i class="fa fa-hourglass-2"></i>
									主信息
								</a>
							</li>
							<li id="nav-tab-2">
								<a data-toggle="tab"  onclick="CutOverTab(2)">
									<i class="fa fa-hourglass"></i>
									电梯信息
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- Tab End -->
				
				<!-- 内容层 一 Start -->
					<div class="panel-body">
						<div class="tab-content">
							
							<!-- 主信息  Start -->
							<div id="tab-1" class="tab-pane" style="display:block">
								<div class="ibox float-e-margins">
									<div class="ibox-content">
										<!-- 主信息内容 Start -->
										<div class="panel panel-primary">
											<div class="panel-heading">主信息</div>
											<div class="panel-body">
											<div class="row" style="margin-left: 10px">
											
											<!-- 10 22 - 10 22 -10 22 -->
											<!-- 第一层 -->
											<div class="form-group form-inline">                                
			                              		<label style="width:10%;">
			                              			<span style="color: #FF0000" color="red">*</span>项目名称:</label>
			                              			<input type="text" name="item_name" id="item_name" value="${pd.item_name}" class="form-control" style="width:22%"/>
			                                 	<label style="width:10%;">
			                                 		<span>&nbsp;</span>客户名称:</label>
			                                 		<input type="hidden" name="customer_name" id="customer_name" value="${pd.customer_name}" /> 
			                                 		<%-- <label style="width: 22%">${pd.selorder_org}</label>  --%>
			                                 		<select style="width:22%;margin-top:16px" name="order_org" id="order_org" dn-value="${pd.order_org }" class="selectpicker" data-live-search="true">
                                    					<option value="">请选择客户名称</option>
                                    				</select>
						                    </div>
						                    <!-- 第二层 -->
						                    <div class="form-group form-inline">
			                                     	
			                                 	<label style="width:10%;">
													<span style="color: #FF0000" color="red">*</span>最终用户:</label>
													<select style="width:22%;margin-top:16px" name="end_user" id="end_user" onchange="setCustomerNo();" class="selectpicker" data-live-search="true">
														<option value="">请选择最终用户</option>
														<c:forEach items="${customerList}" var="var">
															<option value="${var.customer_id}_${var.customer_no}" ${pd.customer_no==var.customer_no?"selected":""}>${var.customer_name}</option>
														</c:forEach>
													</select>
												<label style="width:10%;"><span></span>客户编号:</label>
												<input style="width:22%" placeholder="这里输入客户编号" type="text" name="customer_no" id="customer_no" value="${pd.customer_no }"  title="客户编号" readonly="readonly" class="form-control">
						                    </div>
											<!-- 第二.5层 -->
											<div class="form-group form-inline">
											<label style="width:10%;"><span style="color: #FF0000" color="red">*</span>安装地址:</label>
												<c:if test="${pd.item_area_text !='国际部' }">
													<select style="width:20%;" class="selectpicker" name="province_id" id="province_id" title="区域" onchange="provinceChange();" data-live-search="true">
														<option value="">请选择</option>
														<c:forEach var="province" items="${provinceList}" >
															<option value="${province.id }" <c:if test="${pd.province_id eq province.id }">selected</c:if>  >${province.name }</option>
														</c:forEach>
													</select>
													<select style="width:20%;" id="city_id" name="city_id" class="selectpicker" disabled="disabled" title="城市" onchange="cityChange();" data-live-search="true">
														<option value="">请选择</option>
														<c:forEach var="city" items="${cityList}" >
															<option value="${city.id }" <c:if test="${pd.city_id eq city.id }">selected</c:if>  >${city.name }</option>
														</c:forEach>
													</select>
													<select style="width:20%;" class="selectpicker" name="county_id" id="county_id" title="郡/县" disabled="disabled" data-live-search="true">
														<option value="">请选择</option>
														<c:forEach var="coundty" items="${coundtyList}" >
															<option value="${coundty.id }" <c:if test="${pd.county_id eq coundty.id }">selected</c:if>  >${coundty.name }</option>
														</c:forEach>
													</select>
													<input style="width:20%;margin-top: -5px;" class="form-control" type="text" name="address_info" id="address_info" placeholder="这里输入地址" value="${pd.address_info}"  />
												</c:if>
												<c:if test="${pd.item_area_text =='国际部' }">
													<select style="width:20%;margin-top: 25px;margin-bottom: 10px" class="form-control" name="country_id1" id="country_id1" title="国家">
			                                        	<option value="">请选择</option>
											    		<c:forEach var="country" items="${countryList}" >
											    			<option value="${country.id }" <c:if test="${pd.country_id1 eq country.id }">selected</c:if>  >${country.countryname }</option>
											    		</c:forEach>
													</select>
													<input style="width:60%;margin-top: 25px;margin-bottom: 10px" class="form-control" type="text" name="address_info1" id="address_info1" placeholder="这里输入地址" value="${pd.address_info1}"  />
												
												</c:if>
												
											</div>
						                    <!-- 第三层 -->
						                    <div class="form-group form-inline">                                
			                              		<label style="width:10%;">
			                              			<span><font color="red">*</font></span>合同签订日期:</label>
			                                     	<input style="width:22%" type="text" name="HT_QDRQ" 
			                                     	id="HT_QDRQ" value="${pd.HT_QDRQ}"  
			                                     	placeholder="请输入合同签订日期" title="合同签订日期" class="form-control" onclick="laydate()">
			                                 	<label style="width:10%;">
			                                 		<span><font color="red">*</font></span>免保期限(年):</label>
			                                 		<input style="width:22%" type="text" name="HT_MBQX" 
													id="HT_MBQX" value="${(pd.HT_MBQX==null||pd.HT_MBQX=='')?'1':pd.HT_MBQX}"
													placeholder="请输入免保期限" title="免保期限" class="form-control" oninput="value=value.replace(/[^\-?\d]/g,'')" />
												<label style="width:10%;">
			                                 		<span><font color="red">*</font></span>交货方式:</label>
			                                 		<select style="width:22%" name="HT_JHFS" id="HT_JHFS" class="form-control">
			                                  		<option value="">请选择交货方式</option>
			                                  		<option value="1" ${(pd.HT_JHFS==null||pd.HT_JHFS=='1')?'selected':''}>乙方代办运输</option>
			                                  		<option value="2" ${pd.HT_JHFS=='2'?'selected':''}>甲方自提</option>
			                                 		</select>
						                    </div>
						                    <!-- 第四层 -->
						                    <div class="form-group form-inline">                                
			                              		<label style="width:10%;display: none">
			                              			<span><font color="red">*</font></span>质保金比例%:</label>
			                                     	<input style="width:22%;display: none" type="text" name="HT_ZBJBL"
			                                     	id="HT_ZBJBL" value="${pd.HT_ZBJBL}"  
			                                     	placeholder="请输入保质金比例" title="保质金比例" class="form-control">
			                                 	<label style="width:10%;">
			                                 		<span></span>联系人:</label>
			                                 		<input style="width:22%" type="text" name="HT_LXR" 
													id="HT_LXR" value="${pd.HT_LXR}"
													placeholder="请输入联系人" title="联系人" class="form-control" />
												<label style="width:10%;">
			                                 		<span></span>联系电话:</label>
			                                 		<input style="width:22%" type="text" name="HT_LXDH" 
													id="HT_LXDH" value="${pd.HT_LXDH}"
													placeholder="请输入联系电话" title="联系电话" class="form-control" />
												<label style="width:10%;">
													<span><font color="red">*</font></span>合同类型:</label>
												<select style="width:22%" name="HT_TYPE"
														id="HT_TYPE" class="form-control">
													<option value="">请选择类型</option>
													<option value="1" ${pd.HT_TYPE=='1'?'selected':''}>设备安装分开</option>
													<option value="2" ${pd.HT_TYPE=='2'?'selected':''}>一体式</option>
												</select>
						                    </div>
						                    <!-- 第五层 -->
						                    <div class="form-group form-inline">
												<label style="width:10%;">
													<span><font color="red">*</font></span>预计发货日期:</label>
												<input style="width:22%" type="text" name="HT_YJFHRQ"
													   id="HT_YJFHRQ" value="${pd.HT_YJFHRQ}"
													   placeholder="请输入预计发货日期" title="预计发货日期" class="form-control" onclick="laydate()">
			                              		<label style="width:10%;">
			                              			<span><font color="red">*</font></span>预计开工日期:</label>
			                                     	<input style="width:22%" type="text" name="HT_YJKGRQ" 
			                                     	id="HT_YJKGRQ" value="${pd.HT_YJKGRQ}"  
			                                     	placeholder="请输入预计开工日期" title="预计开工日期" class="form-control" onclick="laydate()">
			                                 	<label style="width:10%;">
			                                 		<span></span>备注:</label>
			                                 		<input style="width:22%" type="text" name="HT_BZ" 
													id="HT_BZ" value="${pd.HT_BZ}"
													placeholder="请输入备注" title="备注" class="form-control" />		
						                    </div>
						                   	<!-- 第六层 -->
						                   	<div class="form-group form-inline">                                
			                              		<label style="width:10%;">
			                              			<span><font color="red">*</font></span>预计施工周期(天):</label>
			                                     	<input style="width:22%" type="text" name="HT_YJSGZQ" 
			                                     	id="HT_YJSGZQ" value="${pd.HT_YJSGZQ}"  
			                                     	placeholder="请输入预计施工周期" title="预计施工周期" class="form-control">
			                                 	<label style="width:10%;">
			                                 		<span><font color="red">*</font></span>预计供货周期(天):</label>
			                                 		<input style="width:22%" type="text" name="HT_YJGHZQ" 
													id="HT_YJGHZQ" value="${pd.HT_YJGHZQ}"
													placeholder="请输入预计供货周期" title="预计供货周期" class="form-control" />
												<label style="width:10%;">
			                                 		<span><font color="red">*</font></span>交货日期:</label>
			                                 		<input style="width:22%" type="text" name="HT_JHRQ" 
													id="HT_JHRQ" value="${pd.HT_JHRQ}"
													placeholder="请输入交货日期" title="交货日期" class="form-control" onclick="laydate()" />
						                    </div>
						                    
						                     <!-- 第7层 -->
						                    <div class="form-group form-inline">                                

			                                 	<label style="width:10%;">
			                              			<span><font color="red">*</font></span>预计验收日期:</label>
			                                     	<input style="width:22%" type="text" name="HT_YJYSRQ" 
			                                     	id="HT_YJYSRQ" value="${pd.HT_YJYSRQ}"  
			                                     	placeholder="请输入预计验收日期" title="预计验收日期" class="form-control" onclick="laydate()">
			                                     	
			                                    <label style="width:10%;">
			                              			<span><font color="red"></font></span>预计质保金收款日期:</label>
			                                     	<input style="width:22%" type="text" name="HT_YJZBJRQ" 
			                                     	id="HT_YJZBJRQ" value="${pd.HT_YJZBJRQ}"  
			                                     	placeholder="请输入预计质保金收款日期" title="预计预计质保金收款日期" class="form-control" onclick="laydate()"> 	
			                                     
			                                     <!-- 修改 -->	
			                                 	<label style="width:10%;">
			                              			<span><font color="red"></font></span>预计信用证收款日期:</label>
			                                     	<input style="width:22%" type="text" name="HT_YJXYZRQ" 
			                                     	id="HT_YJXYZRQ" value="${pd.HT_YJXYZRQ}"  
			                                     	placeholder="请输入预计信用证收款日期" title="预计信用证收款日期" class="form-control" onclick="laydate()"><br>
			                               			

                                                               
						                    </div>
						                    
						                    <!-- 第7.5层 -->
						                    <div class="form-group form-inline">
						                    	<label style="width:10%;">
			                              			<span><font color="red"></font></span> 买断:</label>	
			                                 		      <input type="checkbox" name="HT_SFMD_TEXT"  id="HT_SFMD_TEXT"  value="是" ${msg =='save'?isOfferMD=='1'?'checked':'':pd.HT_SFMD=='1'?'checked':'' } />
                                                          <input type="hidden" name="HT_SFMD" id="HT_SFMD">
 												  &nbsp;&nbsp;
 												  <c:if test="${msg=='view' && isQxViableMLR == '1' }">
                                                  <label style="width:5%;">
                                                  <span><font color="red"></font></span>毛利润:</label>
			                                     	<input style="width:14.5%" type="text" name="HT_profit" 
			                                     	id="HT_profit" value="${pd.HT_MLR}" 
			                                     	class="form-control" disabled="disabled">
			                                     </c:if>
			                                     	
                                	                <!-- 查看进来时显示 -->
								                 <c:if test="${msg =='view' }">
			                                     	<label style="width:10%;">申请人:</label>
			                                     	<label style="width:22%;">${pd.apply_user}</label>
			                                     	<label style="width:10%;">申请时间:</label>
			                                     	<label style="width:15%;">${pd.INPUT_TIME}</label>
								                 </c:if>

						                    </div>
						                    
											<!-- 第8层 -->
												
										<!-- row -->		   
										</div>
									<!-- panel-body -->
									</div>
								<!-- panel panel-primary -->
								</div>
								
								<!-- 商务附件Start -->	
								<div class="panel panel-primary" >
								<!-- 头  -->
								<div class="panel-heading" style="padding-right:30px;">商务附件</div>
								<div class="panel-body">
									<div id="fileLDiv">
										<div class="form-group form-inline">
										<label style="width:10%;">
											<span></span>附件上传:</label>
											<input  type="hidden" name="HT_FJSC" id="HT_FJSC" value="${pd.HT_FJSC}"/>
											<input style="width:20%" class="form-control" type="file" name="HtFjsc" id="HtFjsc"
											readonly placeholder="这里输入附件" title="附件" onchange="upload(this)" />
											<select style="width:10%" name="HT_WJLX" id="HT_WJLX" class="form-control" onchange="setJFHTDisplay();">
												<option value="">文件类型</option>
												<option value="1" ${pd.HT_WJLX=='1'?'selected':''}>土建图</option>
												<option value="2" ${pd.HT_WJLX=='2'?'selected':''}>非标合同</option>
												<option value="4" ${pd.HT_WJLX=='4'?'selected':''}>甲方合同</option>
												<option value="3" ${pd.HT_WJLX=='3'?'selected':''}>其他</option>
											</select>
											<button style="margin-left:3px;margin-top:3px;" class="btn  btn-primary btn-sm"
													title="添加" type="button"onclick="addFlieTag();">加</button>
											<c:if test="${pd ne null and pd.HT_FJSC ne null and pd.HT_FJSC ne '' }">
											  <a class="btn btn-mini btn-success" onclick="downFile(this)">下载附件</a>
											</c:if>
											<input type="hidden" name="FILENAME">
										</div>
									</div>
									<div class="form-group form-inline" id="JFHT">

										<label style="width:5%;">
											技术:</label>
										<textarea name="HT_JF_JS" id="HT_JF_JS" cols="30" rows="2" style="width:18%;" class="form-control">${pd.HT_JF_JS}</textarea>
										<label style="width:5%;">
											安装:</label>
										<textarea name="HT_JF_AZ" id="HT_JF_AZ" cols="30" rows="2" style="width:18%;" class="form-control">${pd.HT_JF_AZ}</textarea>
										<label style="width:5%;">
											维保:</label>
										<textarea name="HT_JF_WB" id="HT_JF_WB" cols="30" rows="2" style="width:18%;" class="form-control">${pd.HT_JF_WB}</textarea>
										<label style="width:5%;">
											财务相关:</label>
										<textarea name="HT_JF_CWXG" id="HT_JF_CWXG" cols="30" rows="2" style="width:18%;" class="form-control">${pd.HT_JF_CWXG}</textarea>

									</div>
								</div>
								</div>
								<!-- 商务附件End -->
								
								<!-- 技术附件Start -->	
								<div class="panel panel-primary" >
								<!-- 头  -->
								<div class="panel-heading" style="padding-right:30px;">技术附件</div>
								<div class="panel-body">
									<div id="fileLJSDiv">
										<div class="form-group form-inline">
										<label style="width:10%;">
											<span></span>附件上传:</label>
											<input disabled="true" type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>
											<input style="width:20%" class="form-control" type="file" name="HtFjsc" id="HtFjsc"
											readonly placeholder="这里输入附件" title="附件" onchange="upload(this)" />
											<input type="hidden">
											<button style="margin-left:3px;margin-top:3px;" class="btn  btn-primary btn-sm"
													title="添加" type="button"onclick="addFlieJSTag();">加</button>
											 <a id="jsfj-panel" style="display: none;" class="btn btn-mini btn-success" onclick="downFile(this)">下载附件</a>
											<input type="hidden" name="FILENAME">
										</div>
									</div>
								</div>
								</div>
								<!-- 技术附件End -->	
								
								<!-- 合同附件 -->
								<c:if test="${CNUpdate=='1' || pd.CONTRACT_ATTA_JSON != null }">
								<div class="panel panel-primary" id='divhthtfj' >
								<!-- 头  -->
								<div class="panel-heading" style="padding-right:30px;">合同附件</div>
								<div class="panel-body">
									<div id="fileLHEDiv">
										<div class="form-group form-inline">
										<label style="width:10%;">
											<span></span>附件上传:</label>
											<input disabled="true" type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>
											<input style="width:20%" class="form-control" type="file" name="HtFjsc" id="HtFjsc"
											readonly placeholder="这里输入附件" title="附件" onchange="upload(this)" />
											<input type="hidden">
											<button style="margin-left:3px;margin-top:3px;" class="btn  btn-primary btn-sm"
													title="添加" type="button"onclick="addFlieHTTag();">加</button>
											 <a id="htfj-panel" style="display: none;" class="btn btn-mini btn-success" onclick="downFile(this)">下载附件</a>
											<input type="hidden" name="FILENAME">
										</div>
									</div>
								</div>
								</div>
								</c:if>
								
								<!-- 付款方式 Start -->	
								<div class="panel panel-primary">
								<!-- 头  -->
								<div class="panel-heading" style="padding-right:30px;">付款方式 </div>
								<div class="panel-body">
								<div class="form-inline" style="font-size:16px;float:left;padding-left:10px;">
										报价总金额:${pd.TOTAL}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合同总金额:${pd.PRICE}
								</div>
								<div class="form-group form-inline" style="float:right;margin-right:20px;margin-bottom:0px;">
			                         <!-- 查看进来时不显示 -->
					                 <c:if test="${msg !='view' }">
					                   <button id="fkfs_add" class="btn btn-sm btn-primary" title="添加"
										type="button" onclick="CNtadAdd();">添加
									   </button>
					                 </c:if>
			                         
			             		</div>
								<div class="row" style="margin-left: 10px;margin-right: 0px;">	
									<table class="table table-striped table-bordered table-hover" id="CNTableFKFS">
										<thead>
											<tr>
												<th>收款期数</th>
												<th>款项</th>
												<th>判断日期</th>
												<th>付款天数</th>
												<th style="display: none;">偏差天数</th>
												<th>付款比例(%)</th>
												<th>金额(元)</th>
												<th>备注</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<!-- 开始循环 -->
											<c:choose>
												<c:when test="${not empty dfkfslist}">
													<c:if test="${QX.cha == 1 }">
														<c:forEach items="${dfkfslist}" var="con" varStatus="vs">
															<tr>
																<td>${vs.index+1}</td>
																<td>
																	<select class="form-control" name='FKFS_KX'>
												                        <option value="1" ${con.FKFS_KX=='1'?'selected':''}>订金</option>
												                        <option value="2" ${con.FKFS_KX=='2'?'selected':''}>排产款</option>
												                        <option value="3" ${con.FKFS_KX=='3'?'selected':''}>发货款</option>
												                        <option value="4" ${con.FKFS_KX=='4'?'selected':''}>货到现场款</option>
												                        <option value="5" ${con.FKFS_KX=='5'?'selected':''}>安装发货款</option>
												                        <option value="6" ${con.FKFS_KX=='6'?'selected':''}>安装开工款</option>
												                        <option value="7" ${con.FKFS_KX=='7'?'selected':''}>验收款</option>
												                        <option value="8" ${con.FKFS_KX=='8'?'selected':''}>质保金</option>
												                        <option value="9" ${con.FKFS_KX=='9'?'selected':''}>信用证</option>
												                    </select>
																</td>
																<td>
																	<select class="form-control" id="" name='FKFS_PDRQ'>
												                        <option value="1" ${con.FKFS_PDRQ=='1'?'selected':''}>合同签订日期</option>
												                        <option value="2" ${con.FKFS_PDRQ=='2'?'selected':''}>预计发货日期</option>
												                        <option value="3" ${con.FKFS_PDRQ=='3'?'selected':''}>预计货到现场日期</option>
												                        <option value="4" ${con.FKFS_PDRQ=='4'?'selected':''}>预计进场日期</option>
												                        <option value="5" ${con.FKFS_PDRQ=='5'?'selected':''}>预计验收日期</option>
												                        <option value="6" ${con.FKFS_PDRQ=='6'?'selected':''}>预计质保金收款日期</option>
												                        <option value="7" ${con.FKFS_PDRQ=='7'?'selected':''}>预计信用证收款日期</option>
												                    </select>
												                </td>
																<td>
																	<input style="width:100%" type="text" name="FKFS_FKTS"
																	value="${con.FKFS_FKTS}" class="form-control" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
																</td>
																<td style="display: none;">
																	<input style="width:100%" type="text" name="FKFS_PCRQ"
																	value="${con.FKFS_PCRQ}" class="form-control" />
																</td>
																<td>
																	<input style="width:100%" type="text" name="FKFS_FKBL"
																	value="${con.FKFS_FKBL}" class="form-control" onkeyup="setPrice(this);"/>
																</td>
																<td>
																	<input style="width:100%" type="text" name="FKFS_JE"
																	value="${con.FKFS_JE}" class="form-control" />
																</td>
																<td>
																	<input style="width:100%" type="text" name="FKFS_BZ"
																	value="${con.FKFS_BZ}" class="form-control" />
																</td>
																<td>
																  <!-- 查看进来时不显示 -->
					                                              <c:if test="${msg !='view' }">
																	<button class="btn btn-sm btn-danger" title="删除"
																			type="button" onclick="CNtabDel(this);">删除
																	</button>
																  </c:if>
																</td>
															</tr>
														</c:forEach>
													</c:if>
													<!-- 权限设置 -->
													<c:if test="${QX.cha == 0 }">
														<tr>
															<td colspan="100" class="center">您无权查看</td>
														</tr>
													</c:if>
												</c:when>
												<c:otherwise>
													<!-- <tr class="main_info">
														<td colspan="100" class="center">没有相关数据</td>
													</tr> -->
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								<!-- 结尾 -->
								</div>
								</div>
								</div>
								<!-- 付款方式  End -->
								<!--new报价批注 -->
								<div class="row">
		                            <div class="col-sm-12">
		                                <div class="panel panel-primary">
		                                    <div class="panel-heading">
	                                        			合同批注
		                                    </div>
		                                    <div class="panel-body">
		                                        <textarea style="width:100%" rows="3" cols="1" name="HT_REMARK" id="HT_REMARK" placeholder="在此输入批注">${pd.HT_REMARK}</textarea>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
								
								<!-- 审批信息 Start -->	
								<%-- <div class="panel panel-primary">
								<div class="panel-heading" style="padding-right:30px;">审批信息 </div>
								<div class="panel-body">
								<div class="row" style="margin-left: 10px;margin-right: 0px;">	
									<table class="table table-striped table-bordered table-hover" id="elevatorOptionalTable">
										<thead>
											<tr>
												<th style="width:20%;">审批环节</th>
												<th style="width:20%;">审批人</th>
												<th style="width:20%;">审批结果</th>
												<th style="width:20%;">审批意见</th>
												<th style="width:20%;">审批时间</th>
											</tr>
										</thead>
										<tbody>
											<!-- 开始循环 -->
											<c:choose>
												<c:when test="${not empty contractNewListSP}">
													<c:if test="${QX.cha == 1 }">
														<c:forEach items="${contractNewListSP}" var="con" varStatus="vs">
															<tr>
																<td>${con.SPHJ}</td>
																<td>${con.SPR}</td>
																<td>
																<select class="form-control" id="" name='FKFSKXPDRQ'>
												                        <option value='同意' ${con.SPJG=='同意'?'selected':''}>同意</option>
												                        <option value='拒绝' ${con.SPJG=='拒绝'?'selected':''}>拒绝</option>
												                </select>
																</td>
																<td>
																<input style="width:100%" type="text" name="SPSPYJ" id="" 
																	value="${con.SPYJ}" class="form-control" />
																</td>
																<td>${con.SPSJ}</td>
															</tr>
														</c:forEach>
													</c:if>
													<!-- 权限设置 -->
													<c:if test="${QX.cha == 0 }">
														<tr>
															<td colspan="100" class="center">您无权查看</td>
														</tr>
													</c:if>
												</c:when>
												<c:otherwise>
													<tr class="main_info">
														<td colspan="100" class="center">没有相关数据</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<div class="form-group form-inline" style="float:right;margin-right:20px;margin-bottom:0px;">
				                         <button class="btn btn-sm btn-success" title="提交"
											type="button" onclick="">提交
										 </button>
				             		</div>
								<!-- 结尾 -->
								</div>
								</div>
								</div> --%>
								<!-- 审批信息  End -->
								
										
										<!-- 主信息内容 End -->
									</div>
								</div>
							</div>
							<!-- 主信息  End -->

							<!-- 电梯信息 Start -->
							<div id="tab-2" class="tab-pane">
								<div class="ibox float-e-margins">
									<div class="ibox-content">
										<!-- 电梯信息内容 Start -->	
										<div class="panel panel-primary">
											<!-- 头  -->
											<div class="panel-heading" style="padding-right:30px;">电梯信息</div>
											<div class="panel-body">
											<div class="form-inline" style="font-size:16px;float:left;padding-left:10px;">
													电梯台数:${pd.DT_NUM}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp报价总金额:${pd.TOTAL}
											</div>
											<div class="row" style="margin-left: 10px;margin-right: 0px;">	
												<table id="dtTab" class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>序号</th>
															<th>合同号</th>
															<th>梯型</th>
															<th>梯号</th>
															<th>层/站/门(提升高度)</th>
															<th>设备单价(元/台)</th>
															<th>安装单价(元/台)</th>
															<th>运输单价(元/台)</th>
															<th>小计(元/台)</th>
														</tr>
													</thead>
													<tbody>
														<!-- 开始循环 -->
														<c:choose>
															<c:when test="${not empty dtxxlist}">
																<c:if test="${QX.cha == 1 }">
																	<c:forEach items="${dtxxlist}" var="con" varStatus="vs">
																		<tr>
																			<td>${vs.index+1} <input type="hidden" name="ele_type" value="${con.ele_type}">
																			<input type="hidden" name="DT_BJC_ID" value="${con.DT_BJC_ID}">
																			<input type="hidden" name="DT_ELEV_ID" value="${con.DT_ELEV_ID}">
																			<input type="hidden" name="DT_UUID" value="${con.DT_UUID}"></td>
																			<td>
																			<input type="hidden" value="${con.DT_NO}" />
																			<input style="width:100%" type="text" name="DT_NO" value="${con.DT_NO}" />
																			<span class="isExistHTH" style="display: none;"><font color="red">合同号已存在</font></span>
																			</td>
																			<td>${con.DT_TX}</td>
																			<td><textarea style="width:100%" rows="1" cols="3" ${msg=='edit'?'':'disabled="disabled"'}>${con.DT_TH}</textarea></td>
																			<td>${con.DT_CZM}</td>
																			<td>${con.DT_SBDJ}</td>
																			<td>${con.DT_AZDJ}</td>
																			<td>${con.DT_YSJ}</td>
																			<td>${con.DT_XJ}</td>
																		</tr>
																	</c:forEach>
																</c:if>
																<!-- 权限设置 -->
																<c:if test="${QX.cha == 0 }">
																	<tr>
																		<td colspan="100" class="center">您无权查看</td>
																	</tr>
																</c:if>
															</c:when>
															<c:otherwise>
																<tr class="main_info">
																	<td colspan="100" class="center">没有相关数据</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											<!-- 结尾 -->
											</div>
											</div>
											</div>
											<!-- 电梯信息内容 End -->
									</div>
								</div>
							</div>
							<!-- 电梯信息 End -->
							
						</div>
					</div>
					<!-- 内容层 一 End -->
			</div>
		</form>
	</div>
 </div>

<!-- Fancy box -->
<script src="static/js/fancybox/jquery.fancybox.js"></script>
<!-- iCheck -->
<script src="static/js/iCheck/icheck.min.js"></script>
<!-- Sweet alert -->
<script src="static/js/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">
	
	//---------------------------xcx-------------------------Start
	//页面加载完成时调用
	$(document).ready(function () {
		//关闭加载层   可能用的上
		parent.layer.closeAll('loading');
        /* tab 默认 主信息*/
        $("#nav-tab-1").addClass("active");
		$("#tab-1").addClass("active");
		
		//弹出框用，可能需要
		$(document).ready(function () {
            /* 图片 */
            $('.fancybox').fancybox({
                openEffect: 'none',
                closeEffect: 'none'
            });
        });
        //编辑时加载楼盘效果图信息
        var htfjscjson = $("#HT_FJSC_JSON").val();
        if(htfjscjson&&htfjscjson!=""){
            setHtFjscJSON(htfjscjson);
        }
        var hthtfjJson = $('#CONTRACT_ATTA_JSON').val();
		if(hthtfjJson && hthtfjJson != ''){
			setHthtfjJsonJSON(hthtfjJson)
		}
        
        if($("#province_id option:selected").val()!=null && $("#province_id option:selected").val()!=""){
            $("#city_id").attr("disabled",false);
        }
        if($("#city_id option:selected").val() !=null && $("#city_id option:selected").val() != ""){
            $("#county_id").attr("disabled",false);
        }
		if('${msg}'=='view'){
            $("input").attr("disabled","disabled");
            $("select").attr("disabled","disabled");
            $("textarea").attr("disabled","disabled");
            $("#fileLDiv").find("button").attr("disabled","disabled");
            $("#fileLJSDiv").find("button").attr("disabled","disabled");
            if('${CNUpdate}'=='1'){
                $("#fileLHEDiv").find("button").removeAttr("disabled");
                $("#fileLHEDiv").find("input").removeAttr("disabled");
            } else {
                $("#fileLHEDiv").find("button").attr("disabled","disabled");
            }
        }

        setJFHTDisplay();
        
        $("input[name=DT_NO]").blur(function(){
        	isExistDTHTH(this, $(this).val());
       	});
        
        getOrderOrg();
        
    });
	
	//切换窗口
	function CutOverTab(num){
		if(num==""||num=="1"){
			//$("#tab-1").slideToggle(500,null)
			$("#tab-1").css("display", "block");
			$("#tab-2").css("display", "none");
        }else if(num=="2"){
        	//$("#tab-2").slideToggle(500,null)
        	$("#tab-1").css("display", "none");
 			$("#tab-2").css("display", "block"); 
        }
	}
	
	//日期范围限制
    /* var start = {
        elem: '#start_time',
        format: 'YYYY/MM/DD hh:mm:ss',
        max: '2099-06-16 23:59:59', //最大日期
        istime:true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end_time',
        format: 'YYYY/MM/DD hh:mm:ss',
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end); */
    
    //关闭页面
    function CloseSUWin(id) {
		window.parent.$("#" + id).data("kendoWindow").close();
		/* 	window.parent.location.reload(); */
	};
    
    //提交
    function CNSubmin(){
    	
    };
    
    //预览
    function CNprview(){
    	
    };
    
    //根据输入的付款比例计算价格
    function setPrice(obj){
    	$(obj).val($(obj).val().replace(/\D/g,''));
    	/* if($(obj).val() == '0'){
    		$(obj).tips({
                side : 3,
                msg : "付款比例不能为0",
                bg : '#AE81FF',
                time : 2,
                x:document.body["scrollTop"] | document.documentElement["scrollTop"]//当body有position:relative或class为position-relative,需设置，避免显示位置出错;
            });
    	} */
    	
    	var a=isNaN(parseInt($(obj).val()))?0:parseInt($(obj).val());
    	
    	var fkbl=a/100;
    	var total=$("#TOTAL").val();
    	$(obj).parent().parent().find("td").eq(6).find("input").val(total*fkbl);
    };
    
    //报价信息
    function CNquoteInformation(offer_id,item_id)
    {
    	$("#ChangeIncontractHTML").kendoWindow({
            width: "550px",
            height: "300px",
            title: "报价信息",
            actions: ["Close"],
            content: '<%=basePath%>contractNew/SeeEoffer.do?offer_id='+offer_id+'&item_id='+item_id,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
    };
    
  	//变更协议
	function CNBGXY(HT_UUID,item_id){
		$("#ChangeIncontractHTML").kendoWindow({
            width: "550px",
            height: "300px",
            title: "合同变更信息",
            actions: ["Close"],
            content: '<%=basePath%>contractModify/list.do?HT_UUID='+HT_UUID+'&item_id='+item_id,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
	};
	
	//付款方式  新增
	function CNtadAdd(){
		var trNum = $("#CNTableFKFS tr").length;
		//克隆第一行
		var tr='<tr>'+
			'<td>'+trNum+'</td>'+
			'<td>'+
			'	<select class="form-control" name='+"'"+'FKFSKX'+"'"+'>'+
            '        <option value='+"'"+'1'+"'"+'>订金</option>'+
            '        <option value='+"'"+'2'+"'"+'>排产款</option>'+
            '        <option value='+"'"+'3'+"'"+'>发货款</option>'+
            '        <option value='+"'"+'4'+"'"+'>货到现场款</option>'+
            '        <option value='+"'"+'5'+"'"+'>安装发货款</option>'+
            '        <option value='+"'"+'6'+"'"+'>安装开工款</option>'+
            '        <option value='+"'"+'7'+"'"+'>验收款</option>'+
            '        <option value='+"'"+'8'+"'"+'>质保金</option>'+
            '        <option value='+"'"+'9'+"'"+'>信用证</option>'+
            '    </select>'+
			'</td>'+
			'<td>'+
			'	<select class="form-control" id="" name='+"'"+'FKFS_PDRQ'+"'"+'>'+
	        '              <option value='+"'"+'1'+"'"+'>合同签订日期</option>'+
	        '              <option value='+"'"+'2'+"'"+'>预计发货日期</option>'+
	        '              <option value='+"'"+'3'+"'"+'>预计货到现场日期</option>'+
	        '              <option value='+"'"+'4'+"'"+'>预计进场日期</option>'+
	        '              <option value='+"'"+'5'+"'"+'>预计验收日期</option>'+
	        '              <option value='+"'"+'6'+"'"+'>预计质保金收款日期</option>'+
	        '              <option value='+"'"+'7'+"'"+'>预计信用证收款日期</option>'+
	        '          </select>'+
	        '      </td>'+
			'<td>'+
			'	<input style="width:100%" type="text" name="FKFS_FKTS" id="" '+
			'	value="" class="form-control" onkeyup="this.value=this.value.replace(/\\D/g,\'\')" onafterpaste="this.value=this.value.replace(/\D/g,\'\')" />'+
			'</td>'+
			'<td  style="display: none;">'+
			'	<input style="width:100%" type="text" name="FKFSPCRQ" id="" '+
			'	value="" class="form-control" />'+
			'</td>'+
			'<td>'+
			'	<input style="width:100%" type="text" name="FKFSFKBL" id="" '+
			'	value="" onkeyup="setPrice(this);" class="form-control" />'+
			'</td>'+
			'<td>'+
			'	<input style="width:100%" type="text" name="FKFSJE" id="" '+
			'	value="" class="form-control" />'+
			'</td>'+
			'<td>'+
			'	<input style="width:100%" type="text" name="FKFSBZ" id="" '+
			'	value="" class="form-control" />'+
			'</td>'+
			'<td>'+
			'	<button class="btn btn-sm btn-danger" title="删除"'+
			'			type="button" onclick="CNtabDel(this);">删除'+
			'	</button>'+
			'</td>'+
		'</tr>';
		$("#CNTableFKFS").append(tr);
	};
	
	//付款方式  删除
	function CNtabDel(obj){
		 swal({
             title: "您确定要删除此条付款方式的信息吗？",
             text: "删除后将无法恢复，请谨慎操作！",
             type: "warning",
             showCancelButton: true,
             confirmButtonColor: "#DD6B55",
             confirmButtonText: "删除",
             cancelButtonText: "取消",
             closeOnConfirm: false,
             closeOnCancel: false
         },
         function (isConfirm) {
             if (isConfirm) {
            	 delTab(obj);
            	 swal({   
			        	title: "删除成功！",
			        	text: "您已经成功删除了这条信息。",
			        	type: "success",  
			        	 }); 
            	/* var url = "";
 				$.get(url,function(data){
 					if(data.msg=='success'){
 						swal({   
 				        	title: "删除成功！",
 				        	text: "您已经成功删除了这条信息。",
 				        	type: "success",  
 				        	 }, 
 				        	function(){   
 				        		delTab(obj); 
 				        	 }); 
 					}else{
 						swal("删除失败", "您的删除操作失败了！", "error");
 					}
 				}); */
             } else {
                 swal("已取消", "您取消了删除操作！", "error");
             }
         });
		//删除 付款方式
		function delTab(obj){
			$(obj).parent().parent().remove();
			//重新标记序号
			var trNum = $("#CNTableFKFS tr").length;
			for(var i=1;i<=trNum;i++){
				$("#CNTableFKFS").find("tr").eq(i).find("td").eq(0).html(i);  
			}; 
		}
	};

	var fileindex=0;
	function addFlieTag(){
	    fileindex+=1;
	    $("#fileLDiv").append(
        '<div class="form-group form-inline" id=flieTag'+fileindex+'> ' +
			'<label style="width:10%;"> <span></span>附件上传:</label>' +
			'<input  type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>' +
		' <input style="width:20%" class="form-control" type="file" ' +
		'name="HtFjsc" id="HtFjsc" readonly placeholder="这里输入附件" ' +
		'title="附件" onchange="upload(this)"/>' +
		' <select style="width:10%" name="HT_WJLX" id="HT_WJLX" class="form-control" onchange="setJFHTDisplay();">' +
		'<option value="">文件类型</option>' +
		'<option value="1">土建图</option>' +
		'<option value="2">非标合同</option>' +
		'<option value="4">甲方合同</option>' +
		'<option value="3">其他</option>' +
		'</select>' +
        '<button style="margin-left:3px;margin-top:3px;" class="btn  btn-danger btn-sm" title="删除" type="button"onclick="deleteFiletag('+fileindex+');">减</button>' +
		'<input type="hidden" name="FILENAME">'+
		'</div>'

		);
    }
    function addFlieTagEdit(){
        fileindex+=1;
        $("#fileLDiv").append(
            '<div class="form-group form-inline" id=flieTag'+fileindex+'> ' +
            '<label style="width:10%;"> <span></span>附件上传:</label>' +
            '<input  type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>' +
            ' <input style="width:20%" class="form-control" type="file" ' +
            'name="HtFjsc" id="HtFjsc" readonly placeholder="这里输入附件" ' +
            'title="附件" onchange="upload(this)"/>' +
            ' <select style="width:10%" name="HT_WJLX" id="HT_WJLX" class="form-control" onchange="setJFHTDisplay();">' +
            '<option value="">文件类型</option>' +
            '<option value="1">土建图</option>' +
            '<option value="2">非标合同</option>' +
            '<option value="4">甲方合同</option>' +
            '<option value="3">其他</option>' +
            '</select>' +
            ' <button style="margin-left:3px;margin-top:3px;" class="btn  btn-danger btn-sm" title="删除" type="button"onclick="deleteFiletag('+fileindex+');">减</button>' +
			' <a class="btn btn-mini btn-success" onclick="downFile(this)">下载附件</a>' +
			'<input type="hidden" name="FILENAME">'+
            '</div>'

        );
    }
    function deleteFiletag(findex){
        $("#flieTag"+findex).remove();
	}

    var fileJSIndex=0;
	function addFlieJSTag(){
		fileJSIndex+=1;
	    $("#fileLJSDiv").append(
        '<div class="form-group form-inline" id=flieJSTag'+fileJSIndex+'> ' +
			'<label style="width:10%;"> <span></span>附件上传:</label>' +
			'<input disabled="true" type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>' +
		' <input style="width:20%" class="form-control" type="file" ' +
		'name="HtFjsc" id="HtFjsc" readonly placeholder="这里输入附件" ' +
		'title="附件" onchange="upload(this)"/>' +
        '<button style="margin-left:3px;margin-top:3px;" class="btn  btn-danger btn-sm" title="删除" type="button"onclick="deleteFileJStag('+fileJSIndex+');">减</button>' +
		'<input type="hidden" name="FILENAME">'+
		'</div>'

		);
    }
    function addFlieJSTagEdit(){
    	fileJSIndex+=1;
        $("#fileLJSDiv").append(
            '<div class="form-group form-inline" id=flieJSTag'+fileJSIndex+'> ' +
            '<label style="width:10%;"> <span></span>附件上传:</label>' +
            '<input disabled="true" type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>' +
            ' <input style="width:20%" class="form-control" type="file" ' +
            'name="HtFjsc" id="HtFjsc" readonly placeholder="这里输入附件" ' +
            'title="附件" onchange="upload(this)"/>' +
            ' <button style="margin-left:3px;margin-top:3px;" class="btn  btn-danger btn-sm" title="删除" type="button"onclick="deleteFileJStag('+fileJSIndex+');">减</button>' +
			' <a class="btn btn-mini btn-success" onclick="downFile(this)">下载附件</a>' +
			'<input type="hidden" name="FILENAME">'+
            '</div>'

        );
    }
    function deleteFileJStag(findex){
        $("#flieJSTag"+findex).remove();
	}
    
    ///合同附件
    var fileHTIndex=0;
	function addFlieHTTag(isEdit){
		fileHTIndex+=1;
		var content = '<div class="form-group form-inline" id=flieHTTag'+fileHTIndex+'> ' +
							'<label style="width:10%;"> <span></span>附件上传:</label>' +
							'<input disabled="true" type="hidden" name="HT_FJSC" id="HT_FJSC" value=""/>' +
						' <input style="width:20%" class="form-control" type="file" ' +
						'name="HtFjsc" id="HtFjsc" readonly placeholder="这里输入附件" ' +
						'title="附件" onchange="upload(this)"/>' +
					    '<button style="margin-left:3px;margin-top:3px;" class="btn  btn-danger btn-sm" title="删除" type="button"onclick="deleteFileHTtag('+fileHTIndex+');">减</button>';
	    
	    if(isEdit == "1"){
	    	content += ' <a class="btn btn-mini btn-success" onclick="downFile(this)">下载附件</a>';
	    }
	    content += '<input type="hidden" name="FILENAME"></div>'
	    $("#fileLHEDiv").append(content);
    }
    function deleteFileHTtag(findex){
        $("#flieHTTag"+findex).remove();
	}

	function setHtFjscJSON(htfjscjson){
        var obj = eval("("+htfjscjson+")");
        var sw = 0;
        var js = 0;
        for(var j = 0;j<obj.length;j++){
        	if(obj[j].HT_JSFJ && obj[j].HT_JSFJ == '1'){
                if(js != 0){
                	addFlieJSTagEdit();
                } else {
            		$('#jsfj-panel').show();
                }
        		$("#fileLJSDiv").find("div:last").each(function(){
                    $(this).find("input").eq(0).val(obj[j].HT_FJSC);
                    $(this).find("select").eq(0).val(obj[j].HT_WJLX);
                    $(this).find("[name='FILENAME']").val(obj[j].FILENAME);
                    $(this).append(obj[j].FILENAME);
                });

        		js++;
        	} else {
                if(sw != 0){
                	addFlieTagEdit();
        		}
        		$("#fileLDiv").find("div:last").each(function(){
                    $(this).find("input").eq(0).val(obj[j].HT_FJSC);
                    $(this).find("select").eq(0).val(obj[j].HT_WJLX);
                    $(this).find("[name='FILENAME']").val(obj[j].FILENAME);
                    $(this).append(obj[j].FILENAME);
                });
        		
        		sw++;
        	}
        }
        /* for(var i = 0;i<obj.length;i++){
            $("#fileLDiv").find("div").eq(i).each(function(){
                $(this).find("input").eq(0).val(obj[i].HT_FJSC);
                $(this).find("select").eq(0).val(obj[i].HT_WJLX);
                $(this).find("[name='FILENAME']").val(obj[i].FILENAME);
                $(this).append(obj[i].FILENAME);
            });
        } */
    }
	
	function setHthtfjJsonJSON(fjjson) {
		var obj = eval("("+fjjson+")");
        var ht = 0;
        for(var j = 0;j<obj.length;j++){
        	if(ht != 0){
            	addFlieHTTag('1');
            } else {
        		$('#htfj-panel').show();
            }
    		$("#fileLHEDiv").find("div:last").each(function(){
                $(this).find("input").eq(0).val(obj[j].HT_FJSC);
                $(this).find("[name='FILENAME']").val(obj[j].FILENAME);
                $(this).append(obj[j].FILENAME);
            });
    		
    		ht++;
        }
        
        if('${CNUpdate}'!='1'){
            if($("#fileLHEDiv").find("div").length > 0){
            	if($("#fileLHEDiv").find("div:last").find("input").val() != ""){
                	$('#divhthtfj').show();
                	return;
            	}
            }
            $('#divhthtfj').hide();
        }
	}
	
	//文件异步上传   e代表当前File对象,v代表对应路径值
	function upload(e) {
		var v=$(e).prev().val();
		var filePath = $(e).val();
		var arr = filePath.split("\\");
		var fileName = arr[arr.length - 1];
		var suffix = filePath.substring(filePath.lastIndexOf("."))
				.toLowerCase();
		var fileType = ".xls|.xlsx|.doc|.docx|.txt|.pdf|";
		if (filePath == null || filePath == "") {
			$(e).prev().val("");
			return false;
		}

		//var data = new FormData($("#agentForm")[0]);
		var data = new FormData();

		data.append("file", $(e)[0].files[0]);

		$.ajax({
			url : "houses/upload.do",
			type : "POST",
			data : data,
			cache : false,
			processData : false,
			contentType : false,
			success : function(result) {
				if (result.success) {
					$(e).prev().val(result.filePath);
                    var flist=$(e).parent().find("[name='HtFjsc']").eq(0).val().split("\\");
                    $(e).parent().find("[name='FILENAME']").val(flist[flist.length-1]);
                    alert("上传成功！");
                    $(e).next().next().show();
				} else {
					alert(result.errorMsg);
				}
			}
		});
	}
	// 下载文件   e代表当前路径值 
	function downFile(e) {
		var downFile = $(e).parent().find("[name='HT_FJSC']").val();
		window.location.href = "cell/down?downFile=" + downFile+"&fileName="+ encodeURIComponent($(e).parent().find("[name='FILENAME']").val());
	}
    
	//保存
	function save(type) 
	{
		
	 if(type=='TJ')
	    {
	    	$("#type").val("TJ");
	    }
	    else
	    {
	    	$("#type").val("BC");
	    }

	
	  if($("#HT_SFMD_TEXT").is(":checked")){
            $("#HT_SFMD").val("1");
        }else{
            $("#HT_SFMD").val("0");
        }
		  
	    if(!$("#item_name").val()||$("#item_name").val()==""){
            $("#item_name").focus();
            $("#item_name").tips({
                side : 3,
                msg : "请输入项目名称",
                bg : '#AE81FF',
                time : 3
            });
            return false;
		}
        if($("#end_user").val()==""){
            $("#end_user").focus();
            $("[data-id='end_user']").tips({
                side:3,
                msg:"选择最终用户",
                bg:'#AE81FF',
                time:2
            });
            return false;
        }
        if($("#province_id").val()==""){
            $("#province_id").focus();
            $("#province_id").tips({
                side:3,
                msg:"选择安装地址",
                bg:'#AE81FF',
                time:2
            });
            return false;
        }
        if($("#city_id").val()==""){
            $("#city_id").focus();
            $("#city_id").tips({
                side:3,
                msg:"选择安装地址",
                bg:'#AE81FF',
                time:2
            });
            return false;
        }
        if($("#county_id").val()==""){
            $("#county_id").focus();
            $("#county_id").tips({
                side:3,
                msg:"选择安装地址",
                bg:'#AE81FF',
                time:2
            });
            return false;
        }
        if($("#address_info").val()==""){
            $("#address_info").focus();
            $("#address_info").tips({
                side:3,
                msg:"填写详细地址",
                bg:'#AE81FF',
                time:2
            });
            return false;
        }
		if ($("#HT_QDRQ").val() == "" && $("#HT_QDRQ").val() == "") {
			$("#HT_QDRQ").focus();
			$("#HT_QDRQ").tips({
				side : 3,
				msg : "请选择合同签订日期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	
		if ($("#HT_MBQX").val() == "" && $("#HT_MBQX").val() == "") {
			$("#HT_MBQX").focus();
			$("#HT_MBQX").tips({
				side : 3,
				msg : "请输入免保期限",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		
		if ($("#HT_JHFS").val() == "" && $("#HT_JHFS").val() == "") {
			$("#HT_JHFS").focus();
			$("#HT_JHFS").tips({
				side : 3,
				msg : "请选择交货方式",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}

		if ($("#HT_YJKGRQ").val() == "" && $("#HT_YJKGRQ").val() == "") {
			$("#HT_YJKGRQ").focus();
			$("#HT_YJKGRQ").tips({
				side : 3,
				msg : "请选择预计开工日期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		if ($("#HT_TYPE").val() == "" && $("#HT_TYPE").val() == "") {
			$("#HT_TYPE").focus();
			$("#HT_TYPE").tips({
				side : 3,
				msg : "请选择合同类型",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		if ($("#HT_YJSGZQ").val() == "" && $("#HT_YJSGZQ").val() == "") {
			$("#HT_YJSGZQ").focus();
			$("#HT_YJSGZQ").tips({
				side : 3,
				msg : "请输入预计施工周期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		if ($("#HT_YJGHZQ").val() == "" && $("#HT_YJGHZQ").val() == "") {
			$("#HT_YJGHZQ").focus();
			$("#HT_YJGHZQ").tips({
				side : 3,
				msg : "请选择预计供货周期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		if ($("#HT_JHRQ").val() == "" && $("#HT_JHRQ").val() == "") {
			$("#HT_JHRQ").focus();
			$("#HT_JHRQ").tips({
				side : 3,
				msg : "请选择交货日期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		
		/* 20180802 东南小郭提出出不需要此校验
		if ($("#HT_YJZBJRQ").val() == "" && $("#HT_YJZBJRQ").val() == "") {
			$("#HT_YJZBJRQ").focus();
			$("#HT_YJZBJRQ").tips({
				side : 3,
				msg : "请选择预计质保金收款日期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}*/
		
		if ($("#HT_YJYSRQ").val() == "" && $("#HT_YJYSRQ").val() == "") {
			$("#HT_YJYSRQ").focus();
			$("#HT_YJYSRQ").tips({
				side : 3,
				msg : "请选择预计验收日期",
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		
		if(!validateHTH()){
			return false;
		}
		
		if(!validateFKSF()){
			return false;
		}
		if(type=='TJ'){
	    	if($("#CNTableFKFS tr:not(:first)").length == 0){
	    		$("#fkfs_add").focus();
				$("#CNTableFKFS").tips({
					side : 3,
					msg : "请添加付款方式",
					bg : '#AE81FF',
					time : 3,
	                x:document.body["scrollTop"] | document.documentElement["scrollTop"]
				});
				return false;
	    	}
	    }
		
		//电梯信息转为json
		var jsonStr="[";
		$("#dtTab tr:not(:first)").each(function()
		{
			jsonStr += "{\'DT_NO\':\'"+$(this).find("td").eq(1).find("input[name=DT_NO]").val()+"\',"+
				        "\'DT_TX\':\'"+$(this).find("td").eq(2).text()+"\',"+
				        "\'DT_TH\':\'"+$(this).find("td").eq(3).find("textarea").val()+"\',"+
				        "\'DT_CZM\':\'"+$(this).find("td").eq(4).text()+"\',"+
				        "\'DT_SBDJ\':\'"+$(this).find("td").eq(5).text()+"\',"+
				        "\'DT_AZDJ\':\'"+$(this).find("td").eq(6).text()+"\',"+
				        "\'DT_YSJ\':\'"+$(this).find("td").eq(7).text()+"\',"+
				        "\'ele_type\':\'"+$(this).find("[name='ele_type']").eq(0).val()+"\',"+
				        "\'DT_BJC_ID\':\'"+$(this).find("[name='DT_BJC_ID']").eq(0).val()+"\',"+
				        "\'DT_ELEV_ID\':\'"+$(this).find("[name='DT_ELEV_ID']").eq(0).val()+"\',"+
				        "\'DT_UUID\':\'"+$(this).find("[name='DT_UUID']").eq(0).val()+"\',"+
				        "\'DT_XJ\':\'"+$(this).find("td").eq(8).text()+"\'},";
			
		});
		jsonStr = (jsonStr.length>1?jsonStr.substring(0,jsonStr.length-1): jsonStr)+"]";
		$("#jsonDt").val(jsonStr);

		//付款信息转为json
		var jsonFkfs="[";
		var PRICE=0;
		$("#CNTableFKFS tr:not(:first)").each(function()
		{
			PRICE += Number($(this).find("td").eq(6).find("input").eq(0).val());
			jsonFkfs += "{\'FKFS_QS\':\'"+$(this).find("td").eq(0).text()+"\',"+
				         "\'FKFS_KX\':\'"+$(this).find("td").eq(1).find("select").eq(0).val()+"\',"+
				         "\'FKFS_PDRQ\':\'"+$(this).find("td").eq(2).find("select").eq(0).val()+"\',"+
                		 "\'FKFS_FKTS\':\'"+$(this).find("td").eq(3).find("input").eq(0).val()+"\',"+
				         "\'FKFS_PCRQ\':\'"+$(this).find("td").eq(4).find("input").eq(0).val()+"\',"+
				         "\'FKFS_FKBL\':\'"+$(this).find("td").eq(5).find("input").eq(0).val()+"\',"+
				         "\'FKFS_JE\':\'"+$(this).find("td").eq(6).find("input").eq(0).val()+"\',"+
				         "\'FKFS_BZ\':\'"+$(this).find("td").eq(7).find("input").eq(0).val()+"\'},";
			
		});
		$("#PRICE").val(PRICE);
		jsonFkfs = (jsonFkfs.length>1?jsonFkfs.substring(0,jsonFkfs.length-1): jsonFkfs)+"]";
		$("#jsonFkfs").val(jsonFkfs);

		var vaFj = true;
		var isHasTJT = false;
        var h="";
        var hjs="";
        var json = "[";
        //附件拼接为json格式保存
        $("#fileLDiv").find("div").each(function(i){
            h = $(this).find("input").eq(0).val();
            var fname= $(this).find("[name='FILENAME']").eq(0).val();

            var seltype=$(this).find("select").eq(0).val();
            
            if(i == 0 && $("#fileLDiv").find("div").length == 1){
            	if(h == "" && seltype == ""){
                	return false;
            	}
            }
            
            if(!validateFJ($(this).find("select"),h,$(this).find("input[type=file]"))){
            	vaFj = false;
            	return false;
            }
            
            if(seltype == "1"){
            	isHasTJT = true;
            }
            
            json += "{\'HT_FJSC\':\'"+h+"\',\'HT_WJLX\':\'"+seltype+"\',\'FILENAME\':\'"+fname+"\'},";
        });
        if(!vaFj){
        	return false;
        }
        if(!isHasTJT){
        	$("#fileLDiv").find("input[type=file]").eq(0).focus();
        	$("#fileLDiv").tips({
				side : 3,
				msg : "请上传土建图",
				bg : '#AE81FF',
				time : 3,
                x:document.body["scrollTop"] | document.documentElement["scrollTop"]
			});
        	return false;
        }
      //附件拼接为json格式保存
        $("#fileLJSDiv").find("div").each(function(){
        	hjs = $(this).find("input").eq(0).val();
        	if(hjs!=""&&hjs!=null){
        		 var fname= $(this).find("[name='FILENAME']").eq(0).val();

                 var seltype=$(this).find("select").eq(0).val();
                 if(!seltype){
                 	seltype = '';
                 }
                 json += "{\'HT_JSFJ\':\'1\',\'HT_FJSC\':\'"+hjs+"\',\'HT_WJLX\':\'"+seltype+"\',\'FILENAME\':\'"+fname+"\'},";
        	}
        });
        json =  (json.length>1?json.substring(0,json.length-1): json) +"]";
        if((h==""||h==null) && (hjs==""||hjs==null))
        {
            $("#HT_FJSC_JSON").val("");
        }
        else
        {
            $("#HT_FJSC_JSON").val(json);
        }
		//console.log(json);

		$("#ContractNewForm").submit();
		layer.load(1);
	}
	
    //修改最终用户时改变客户编号
    function setCustomerNo(){
        var str = $("#end_user").val();
        if(str.indexOf("_")>-1){
            str = str.substring(str.indexOf("_")+1,str.length);
            $("#customer_name").val( $("#end_user").find("option:selected").text());
        }else{
            str="";
            $("#customer_name").val("");
        }
        $("#customer_no").val(str);
    }

    function provinceChange(){
        var province_id = $("#province_id option:selected").val();
        if(province_id!=null && province_id!=""){
            $.post("city/findAllCityByProvinceId.do",{province_id:province_id},function(result){
                $("#city_id").empty();
                $("#county_id").empty();
                if(result.length>0){
                    $("#city_id").attr("disabled",false);
                    $("#city_id").append("<option value=''>请选择</option>");
                    $.each(result,function(key,value){
                        $("#city_id").append("<option value='"+value.id+"'  >"+value.name+"</option>");
                    });
                    $("#county_id").attr("disabled",true);
                }else{
                    $("#city_id").attr("disabled",true);
                }
    			$("#city_id").selectpicker('refresh');
    			$("#county_id").selectpicker('refresh');
            });
        }else{
            $("#city_id").empty();
            $("#city_id").attr("disabled",true);
            $("#county_id").empty();
            $("#county_id").attr("disabled",true);

			$("#city_id").selectpicker('refresh');
			$("#county_id").selectpicker('refresh');
        }
    }

    function cityChange(id){
        var city_id = $("#city_id option:selected").val();
        if(city_id !=null && city_id !=""){
            $.post("city/findAllCountyByCityId.do",{city_id:city_id},function(result){
                $("#county_id").empty();
                if(result.length>0){
                    $("#county_id").attr("disabled",false);
                    $("#county_id").append("<option value=''>请选择</option>");
                    $.each(result,function(key,value){
                        $("#county_id").append("<option value='"+value.id+"'>"+value.name+"</option>");
                    });
                }else{
                    $("#county_id").attr("disabled",true);
                }

    			$("#county_id").selectpicker('refresh');
            });
        }else{
            $("#county_id").empty();
            $("#county_id").attr("disabled",true);
			$("#county_id").selectpicker('refresh');
        }
    }

    function setJFHTDisplay() {
	    var candis=false;
		$("#fileLDiv").find("[name='HT_WJLX']").each(function(idx){
		   if($(this).val()=='4'){
		       candis=true;
		       return false;
		   }
		});
		if(candis)$("#JFHT").show();
		else $("#JFHT").hide();
    }

    function isExistDTHTH(ele, DT_NO) {
    	var yuanDTNO = $(ele).prev().val();
    	var warn = $(ele).next();
    	if((yuanDTNO == '') || (yuanDTNO != DT_NO)){
    		if(yuanDTNO != '' && DT_NO == ''){
    			$(ele).val(yuanDTNO);
    			warn.hide();
    		}
    		
        	$.post("contractNew/isExistDTHTH.do",{DT_NO:DT_NO},function(result){
        		if(!result){
        			warn.hide();
        			if(isExistDTHTHForTable(DT_NO, $(ele).parents("tr").index())){
        				warn.show();
        			}
        		} else {
        			warn.show();
        		}
            });
    	} else {
    		warn.hide();
    	}
	}
    
    function validateHTH() {
		/* var hts = $('.isExistHTH:visible');
		alert($('.isExistHTH').css("display"));
		if(hts.length > 0){
			hts.eq(0).prev().focus();
			return false;
		} */
		var b = true;
		var hts = $('.isExistHTH');
		$.each(hts, function() {
			if($(this).css("display") != 'none'){
				if($('#nav-tab-1').hasClass('active')){
					//layer.msg("电梯信息 => 合同号已存在");
        			$("#nav-tab-1").removeClass("active");
        			$("#nav-tab-2").addClass("active");
					CutOverTab(2);
				}
				$(this).eq(0).prev().focus();
				b = false;
				return false;
			}
		});
		return b;
	}
    
    function isExistDTHTHForTable(DT_NO, i) {
    	if(DT_NO == "") return false;
    	
    	var b = false;
    	$("#dtTab tr:not(:first)").each(function(index){
    		var _DT_NO = $(this).find("td").eq(1).find("input[name=DT_NO]").val();
    		if(i != index && _DT_NO == DT_NO){
        		//$(this).find("td").eq(1).find(".isExistHTH").show();
        		b = true;
    			return;
    		}
		});
    	return b;
	}
    
    function validateFKSF() {
    	var iss = true;
    	$('input[name="FKFS_FKTS"]').each(function(i) {
			if($(this).val() == ''){
				$(this).focus() 
				$(this).tips({
	                side : 3,
	                msg : "请输入付款天数",
	                bg : '#AE81FF',
	                time : 3,
	                x:document.body["scrollTop"] | document.documentElement["scrollTop"]//当body有position:relative或class为position-relative,需设置，避免显示位置出错;
	            });
				iss = false;
				return false;
			}
    		
			var FKFSFKBL = $("#CNTableFKFS tr").eq(i+1).find("td").eq(5).find("input");
			if(FKFSFKBL.length > 0 && (FKFSFKBL.val() == '' || FKFSFKBL.val() == '0')){
				FKFSFKBL.focus();
				var mss = '请输入付款比例';
				if(FKFSFKBL.val() == '0'){
					mss = '付款比例不能为0';
				}
				FKFSFKBL.tips({
	                side : 3,
	                msg : mss,
	                bg : '#AE81FF',
	                time : 3,
	                x:document.body["scrollTop"] | document.documentElement["scrollTop"]//当body有position:relative或class为position-relative,需设置，避免显示位置出错;
	            });

				iss = false;
				return false;
			}
			
		});
    	return iss;
	}
    
	function validateFJ(seltype, fname, fileEle) {
		if(seltype.val() == ""){
			seltype.focus();
			seltype.tips({
				side : 3,
				msg : "请选择文件类型",
				bg : '#AE81FF',
				time : 3,
                x:document.body["scrollTop"] | document.documentElement["scrollTop"]
			});
        	return false;
        }
        if(fname == ""){
        	fileEle.focus();
        	fileEle.tips({
				side : 3,
				msg : "请上传文件",
				bg : '#AE81FF',
				time : 3,
                x:document.body["scrollTop"] | document.documentElement["scrollTop"]
			});
        	return false;
        }
        return true;
	}
    
    /**
    * 保存合同附件
    */
    function saveHtFile() {
        var hjs="";
        var fj = "";
        var json = "[";
      	//附件拼接为json格式保存
        $("#fileLHEDiv").find("div").each(function(){
        	hjs = $(this).find("input").eq(0).val();
        	if(hjs!=""&&hjs!=null){
        		 var fname= $(this).find("[name='FILENAME']").eq(0).val();

                 if(fname && fname != ''){
                     json += "{\'HT_FJSC\':\'"+hjs+"\',\'FILENAME\':\'"+fname+"\'},";
                 }
        	}
        });
        json =  (json.length>1?json.substring(0,json.length-1): json) +"]";
        if(hjs==""||hjs==null){
        }
        else{
        	fj = json;
        }
        var HT_UUID = $('#HT_UUID').val();
        
        var index = layer.load(1);
		$.ajax({
		    type: 'POST',
		    url: '<%=basePath%>contractNew/saveOfHThtfj.do',
		    data: {
		    	HT_UUID:HT_UUID,
		    	hthtfj:fj
		    },
		    dataType: "JSON",
		    success: function(data) {
		    	layer.close(index);
		    	if(data.code == 1){
		    		window.parent.refreshCurrentTab();
		    		CloseSUWin('InformationHTML');
		    	} else {
		    		layer.msg('保存失败', {icon: 2});
		    	}
		    },
		    error: function(data) {
		    	layer.close(index);
		    	layer.msg('操作失败', {icon: 2});
		    }
		});
    	
	}
    
  	//订购单位列表
	function getOrderOrg(){
		var saleType = $("#sale_type").val();
		var orderOrgId = $("#order_org").attr("dn-value");
		if(saleType!=""){
			$.post("<%=basePath%>contractNew/getOrderOrg.do?sale_type="+saleType,
					function(data){
						if(data.msg == "success"){
							var obj = data.orderOrgs;
							var optStr = "<option value=''>请选择客户名称</option>";
							for(var i = 0;i<obj.length;i++){
								optStr += "<option value='"+obj[i].id+"'";
								if(obj[i].id==orderOrgId){
									optStr += " selected ";
								}
								optStr +=  ">"+obj[i].name+"</option>";
							}
							$("#order_org").empty();
							$("#order_org").append(optStr);
							$("#order_org").selectpicker("refresh");
							
						}
					}
			);
		}
	}
    
    
</script>

</body>
</html>
