package com.jeecg.inspection.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 外协加工申请
 * @author onlineGenerator
 * @date 2019-04-13 23:21:35
 * @version V1.0   
 *
 */
@Entity
@Table(name = "subcontract_inspection", schema = "")
@SuppressWarnings("serial")
public class SubcontractInspectionEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**创建人名称*/
	private java.lang.String createName;
	/**创建人登录名称*/
	private java.lang.String createBy;
	/**创建日期*/
	private java.util.Date createDate;
	/**更新人名称*/
	private java.lang.String updateName;
	/**更新人登录名称*/
	private java.lang.String updateBy;
	/**更新日期*/
	private java.util.Date updateDate;
	/**所属部门*/
	private java.lang.String sysOrgCode;

	/**流程状态*/
	private java.lang.String bpmStatus;
	/**申请单号*/
	@Excel(name="申请单号",width=15,dictTable ="subcontract_plan",dicCode ="id",dicText ="id")
	private java.lang.String applyno;
	/**项目名称*/
	@Excel(name="项目名称",width=15)
	private java.lang.String xmmc;
	/**申请部门*/
	@Excel(name="申请部门",width=15,dictTable ="t_s_depart",dicCode ="id",dicText ="departname")
	private java.lang.String sqbm;
	/**所内型号*/
	@Excel(name="所内型号",width=15)
	private java.lang.String snxh;
	/**课题号*/
	@Excel(name="课题号",width=15)
	private java.lang.String kth;
	/**项目负责人*/
	@Excel(name="项目负责人",width=15)
	private java.lang.String xmfzr;
	/**外协加工单位*/
	@Excel(name="外协加工单位",width=15,dictTable ="subcontract_supplier",dicCode ="dwmc",dicText ="dwmc")
	private java.lang.String wxjgdw;
	/**地址*/
	@Excel(name="地址",width=15)
	private java.lang.String dz;
	/**联系人*/
	@Excel(name="联系人",width=15)
	private java.lang.String lxr;
	/**电话*/
	@Excel(name="电话",width=15)
	private java.lang.String dh;
	/**传真*/
	@Excel(name="传真",width=15)
	private java.lang.String cz;
	/**数量*/
	@Excel(name="数量",width=15)
	private java.lang.String sl;
	/**编号*/
	@Excel(name="编号",width=15)
	private java.lang.String bh;
	/**说明*/
	@Excel(name="说明",width=15)
	private java.lang.String sm;
	/**申请日期*/
	@Excel(name="申请日期",width=15,format = "yyyy-MM-dd")
	private java.util.Date applydate;
	/**要求完成日期*/
	@Excel(name="要求完成日期",width=15,format = "yyyy-MM-dd")
	private java.util.Date completedate;
	/**附件*/
	@Excel(name="附件",width=15)
	private java.lang.String attach;
	/**委托内容*/
	@Excel(name="委托内容",width=15)
	private java.lang.String wtlr;
	/**具体要求*/
	@Excel(name="具体要求",width=15)
	private java.lang.String jtyq;
	/**备注*/
	@Excel(name="备注",width=15)
	private java.lang.String bz;
	/**部门负责人意见*/
	@Excel(name="部门负责人意见",width=15)
	private java.lang.String bmyj;
	/**部门主管领导审批意见*/
	@Excel(name="部门主管领导审批意见",width=15)
	private java.lang.String bmldyj;
	/**公司领导审批意见*/
	@Excel(name="公司领导审批意见",width=15)
	private java.lang.String gsldyj;
	/**加急完成时间*/
	@Excel(name="加急完成时间",width=15,format = "yyyy-MM-dd")
	private java.util.Date urgentdate;
	/**实际费用*/
	@Excel(name="实际费用",width=15)
	private java.lang.Double cost;
	/**外协加工类型*/
	private java.lang.String wxjglx;
	/**预估费用*/
	@Excel(name="预估费用",width=15)
	private java.lang.Double plancost;
	/**申请编号*/
	@Excel(name="申请编号",width=15)
	private java.lang.String applybh;
	/**部门主任姓名*/
	@Excel(name="部门主任姓名",width=15)
	private java.lang.String bmyjxm;
	/**部门审核时间*/
	@Excel(name="部门审核时间",width=15,format = "yyyy-MM-dd")
	private java.util.Date bmshsj;
	/**部门主管姓名*/
	@Excel(name="部门主管姓名",width=15)
	private java.lang.String bmzgldxm;
	/**部门主管审核时间*/
	@Excel(name="部门主管审核时间",width=15,format = "yyyy-MM-dd")
	private java.util.Date bmzgshsj;
	/**公司领导姓名*/
	@Excel(name="公司领导姓名",width=15)
	private java.lang.String gsldxm;
	/**公司领导审核时间*/
	@Excel(name="公司领导审核时间",width=15,format = "yyyy-MM-dd")
	private java.util.Date gsldshsj;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")

	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人名称
	 */

	@Column(name ="CREATE_NAME",nullable=true,length=50)
	public java.lang.String getCreateName(){
		return this.createName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人名称
	 */
	public void setCreateName(java.lang.String createName){
		this.createName = createName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人登录名称
	 */

	@Column(name ="CREATE_BY",nullable=true,length=50)
	public java.lang.String getCreateBy(){
		return this.createBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人登录名称
	 */
	public void setCreateBy(java.lang.String createBy){
		this.createBy = createBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建日期
	 */

	@Column(name ="CREATE_DATE",nullable=true,length=20)
	public java.util.Date getCreateDate(){
		return this.createDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建日期
	 */
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人名称
	 */

	@Column(name ="UPDATE_NAME",nullable=true,length=50)
	public java.lang.String getUpdateName(){
		return this.updateName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人名称
	 */
	public void setUpdateName(java.lang.String updateName){
		this.updateName = updateName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人登录名称
	 */

	@Column(name ="UPDATE_BY",nullable=true,length=50)
	public java.lang.String getUpdateBy(){
		return this.updateBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人登录名称
	 */
	public void setUpdateBy(java.lang.String updateBy){
		this.updateBy = updateBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新日期
	 */

	@Column(name ="UPDATE_DATE",nullable=true,length=20)
	public java.util.Date getUpdateDate(){
		return this.updateDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新日期
	 */
	public void setUpdateDate(java.util.Date updateDate){
		this.updateDate = updateDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所属部门
	 */

	@Column(name ="SYS_ORG_CODE",nullable=true,length=50)
	public java.lang.String getSysOrgCode(){
		return this.sysOrgCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属部门
	 */
	public void setSysOrgCode(java.lang.String sysOrgCode){
		this.sysOrgCode = sysOrgCode;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  流程状态
	 */

	@Column(name ="BPM_STATUS",nullable=true,length=32)
	public java.lang.String getBpmStatus(){
		return this.bpmStatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  流程状态
	 */
	public void setBpmStatus(java.lang.String bpmStatus){
		this.bpmStatus = bpmStatus;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请单号
	 */

	@Column(name ="APPLYNO",nullable=true,length=32)
	public java.lang.String getApplyno(){
		return this.applyno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请单号
	 */
	public void setApplyno(java.lang.String applyno){
		this.applyno = applyno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  项目名称
	 */

	@Column(name ="XMMC",nullable=true,length=32)
	public java.lang.String getXmmc(){
		return this.xmmc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  项目名称
	 */
	public void setXmmc(java.lang.String xmmc){
		this.xmmc = xmmc;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请部门
	 */

	@Column(name ="SQBM",nullable=true,length=32)
	public java.lang.String getSqbm(){
		return this.sqbm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请部门
	 */
	public void setSqbm(java.lang.String sqbm){
		this.sqbm = sqbm;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所内型号
	 */

	@Column(name ="SNXH",nullable=true,length=32)
	public java.lang.String getSnxh(){
		return this.snxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所内型号
	 */
	public void setSnxh(java.lang.String snxh){
		this.snxh = snxh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  课题号
	 */

	@Column(name ="KTH",nullable=true,length=32)
	public java.lang.String getKth(){
		return this.kth;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  课题号
	 */
	public void setKth(java.lang.String kth){
		this.kth = kth;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  项目负责人
	 */

	@Column(name ="XMFZR",nullable=true,length=32)
	public java.lang.String getXmfzr(){
		return this.xmfzr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  项目负责人
	 */
	public void setXmfzr(java.lang.String xmfzr){
		this.xmfzr = xmfzr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外协加工单位
	 */

	@Column(name ="WXJGDW",nullable=true,length=32)
	public java.lang.String getWxjgdw(){
		return this.wxjgdw;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外协加工单位
	 */
	public void setWxjgdw(java.lang.String wxjgdw){
		this.wxjgdw = wxjgdw;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  地址
	 */

	@Column(name ="DZ",nullable=true,length=32)
	public java.lang.String getDz(){
		return this.dz;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  地址
	 */
	public void setDz(java.lang.String dz){
		this.dz = dz;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系人
	 */

	@Column(name ="LXR",nullable=true,length=32)
	public java.lang.String getLxr(){
		return this.lxr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系人
	 */
	public void setLxr(java.lang.String lxr){
		this.lxr = lxr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电话
	 */

	@Column(name ="DH",nullable=true,length=32)
	public java.lang.String getDh(){
		return this.dh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电话
	 */
	public void setDh(java.lang.String dh){
		this.dh = dh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  传真
	 */

	@Column(name ="CZ",nullable=true,length=32)
	public java.lang.String getCz(){
		return this.cz;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  传真
	 */
	public void setCz(java.lang.String cz){
		this.cz = cz;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  数量
	 */

	@Column(name ="SL",nullable=true,length=32)
	public java.lang.String getSl(){
		return this.sl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  数量
	 */
	public void setSl(java.lang.String sl){
		this.sl = sl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  编号
	 */

	@Column(name ="BH",nullable=true,length=32)
	public java.lang.String getBh(){
		return this.bh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  编号
	 */
	public void setBh(java.lang.String bh){
		this.bh = bh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  说明
	 */

	@Column(name ="SM",nullable=true,length=320)
	public java.lang.String getSm(){
		return this.sm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  说明
	 */
	public void setSm(java.lang.String sm){
		this.sm = sm;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  申请日期
	 */

	@Column(name ="APPLYDATE",nullable=true,length=32)
	public java.util.Date getApplydate(){
		return this.applydate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  申请日期
	 */
	public void setApplydate(java.util.Date applydate){
		this.applydate = applydate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  要求完成日期
	 */

	@Column(name ="COMPLETEDATE",nullable=true,length=32)
	public java.util.Date getCompletedate(){
		return this.completedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  要求完成日期
	 */
	public void setCompletedate(java.util.Date completedate){
		this.completedate = completedate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  附件
	 */

	@Column(name ="ATTACH",nullable=true,length=320)
	public java.lang.String getAttach(){
		return this.attach;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  附件
	 */
	public void setAttach(java.lang.String attach){
		this.attach = attach;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  委托内容
	 */

	@Column(name ="WTLR",nullable=true,length=32)
	public java.lang.String getWtlr(){
		return this.wtlr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  委托内容
	 */
	public void setWtlr(java.lang.String wtlr){
		this.wtlr = wtlr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  具体要求
	 */

	@Column(name ="JTYQ",nullable=true,length=320)
	public java.lang.String getJtyq(){
		return this.jtyq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  具体要求
	 */
	public void setJtyq(java.lang.String jtyq){
		this.jtyq = jtyq;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */

	@Column(name ="BZ",nullable=true,length=320)
	public java.lang.String getBz(){
		return this.bz;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setBz(java.lang.String bz){
		this.bz = bz;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门负责人意见
	 */

	@Column(name ="BMYJ",nullable=true,length=320)
	public java.lang.String getBmyj(){
		return this.bmyj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门负责人意见
	 */
	public void setBmyj(java.lang.String bmyj){
		this.bmyj = bmyj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门主管领导审批意见
	 */

	@Column(name ="BMLDYJ",nullable=true,length=320)
	public java.lang.String getBmldyj(){
		return this.bmldyj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门主管领导审批意见
	 */
	public void setBmldyj(java.lang.String bmldyj){
		this.bmldyj = bmldyj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司领导审批意见
	 */

	@Column(name ="GSLDYJ",nullable=true,length=320)
	public java.lang.String getGsldyj(){
		return this.gsldyj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司领导审批意见
	 */
	public void setGsldyj(java.lang.String gsldyj){
		this.gsldyj = gsldyj;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  加急完成时间
	 */

	@Column(name ="URGENTDATE",nullable=true,length=32)
	public java.util.Date getUrgentdate(){
		return this.urgentdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  加急完成时间
	 */
	public void setUrgentdate(java.util.Date urgentdate){
		this.urgentdate = urgentdate;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  实际费用
	 */

	@Column(name ="COST",nullable=true,length=32)
	public java.lang.Double getCost(){
		return this.cost;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  实际费用
	 */
	public void setCost(java.lang.Double cost){
		this.cost = cost;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外协加工类型
	 */

	@Column(name ="WXJGLX",nullable=true,length=32)
	public java.lang.String getWxjglx(){
		return this.wxjglx;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外协加工类型
	 */
	public void setWxjglx(java.lang.String wxjglx){
		this.wxjglx = wxjglx;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  预估费用
	 */

	@Column(name ="PLANCOST",nullable=true,length=32)
	public java.lang.Double getPlancost(){
		return this.plancost;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  预估费用
	 */
	public void setPlancost(java.lang.Double plancost){
		this.plancost = plancost;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请编号
	 */

	@Column(name ="APPLYBH",nullable=true,length=32)
	public java.lang.String getApplybh(){
		return this.applybh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请编号
	 */
	public void setApplybh(java.lang.String applybh){
		this.applybh = applybh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门主任姓名
	 */

	@Column(name ="BMYJXM",nullable=true,length=32)
	public java.lang.String getBmyjxm(){
		return this.bmyjxm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门主任姓名
	 */
	public void setBmyjxm(java.lang.String bmyjxm){
		this.bmyjxm = bmyjxm;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  部门审核时间
	 */

	@Column(name ="BMSHSJ",nullable=true,length=32)
	public java.util.Date getBmshsj(){
		return this.bmshsj;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  部门审核时间
	 */
	public void setBmshsj(java.util.Date bmshsj){
		this.bmshsj = bmshsj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门主管姓名
	 */

	@Column(name ="BMZGLDXM",nullable=true,length=32)
	public java.lang.String getBmzgldxm(){
		return this.bmzgldxm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门主管姓名
	 */
	public void setBmzgldxm(java.lang.String bmzgldxm){
		this.bmzgldxm = bmzgldxm;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  部门主管审核时间
	 */

	@Column(name ="BMZGSHSJ",nullable=true,length=32)
	public java.util.Date getBmzgshsj(){
		return this.bmzgshsj;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  部门主管审核时间
	 */
	public void setBmzgshsj(java.util.Date bmzgshsj){
		this.bmzgshsj = bmzgshsj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司领导姓名
	 */

	@Column(name ="GSLDXM",nullable=true,length=32)
	public java.lang.String getGsldxm(){
		return this.gsldxm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司领导姓名
	 */
	public void setGsldxm(java.lang.String gsldxm){
		this.gsldxm = gsldxm;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  公司领导审核时间
	 */

	@Column(name ="GSLDSHSJ",nullable=true,length=32)
	public java.util.Date getGsldshsj(){
		return this.gsldshsj;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  公司领导审核时间
	 */
	public void setGsldshsj(java.util.Date gsldshsj){
		this.gsldshsj = gsldshsj;
	}
}
