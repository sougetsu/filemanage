package com.jeecg.module.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 模块产品外包
 * @author onlineGenerator
 * @date 2019-04-14 01:15:02
 * @version V1.0   
 *
 */
@Entity
@Table(name = "moduleSubcontract_apply", schema = "")
@SuppressWarnings("serial")
public class ModulesubcontractApplyEntity implements java.io.Serializable {/**主键*/
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
	/**所属公司*/
	private java.lang.String sysCompanyCode;
	/**流程状态*/
	private java.lang.String bpmStatus;
	/**编号*/
	@Excel(name="编号",width=15)
	private java.lang.String bh;
	/**产品名称*/
	@Excel(name="产品名称",width=15)
	private java.lang.String cpmc;
	/**申请部门*/
	@Excel(name="申请部门",width=15,dictTable ="t_s_depart",dicCode ="id",dicText ="departname")
	private java.lang.String sqbm;
	/**产品代号*/
	@Excel(name="产品代号",width=15)
	private java.lang.String cpdh;
	/**课题号*/
	@Excel(name="课题号",width=15)
	private java.lang.String kth;
	/**申请人*/
	@Excel(name="申请人",width=15)
	private java.lang.String sqr;
	/**外包项目*/
	@Excel(name="外包项目",width=15)
	private java.lang.String wbxm;
	/**外包项目其他*/
	@Excel(name="外包项目其他",width=15)
	private java.lang.String wbxmqt;
	/**要求完成时间*/
	@Excel(name="要求完成时间",width=15,format = "yyyy-MM-dd")
	private java.util.Date yqwcsj;
	/**数量*/
	@Excel(name="数量",width=15)
	private java.lang.String sl;
	/**预计金额*/
	@Excel(name="预计金额",width=15)
	private java.lang.Double yjje;
	/**外包供应商*/
	@Excel(name="外包供应商",width=15,dictTable ="subcontract_supplier",dicCode ="id",dicText ="dwmc")
	private java.lang.String wbgys;
	/**联系人*/
	@Excel(name="联系人",width=15)
	private java.lang.String lxr;
	/**电话*/
	@Excel(name="电话",width=15)
	private java.lang.String dh;
	/**特殊过程标志*/
	@Excel(name="特殊过程标志",width=15)
	private java.lang.Integer specialflag;
	/**重要标志*/
	@Excel(name="重要标志",width=15)
	private java.lang.Integer importantflag;
	/**具体外包要求*/
	@Excel(name="具体外包要求",width=15)
	private java.lang.String jtwbyq;
	/**技术文件列表*/
	@Excel(name="技术文件列表",width=15)
	private java.lang.String jswjlb;
	/**部门负责人意见*/
	@Excel(name="部门负责人意见",width=15)
	private java.lang.String bmfzryj;
	/**部门主管领导意见*/
	@Excel(name="部门主管领导意见",width=15)
	private java.lang.String bmzgldyj;
	/**公司领导审批意见*/
	@Excel(name="公司领导审批意见",width=15)
	private java.lang.String gsldspyj;
	/**技术文件列表其他*/
	@Excel(name="技术文件列表其他",width=15)
	private java.lang.String jswjlbqt;
	/**附件*/
	@Excel(name="附件",width=20)
	private java.lang.String attach;
	/**外协加工类型*/
	@Excel(name="外协加工类型",width=15)
	private java.lang.String wxjglx;
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
	/**实际金额*/
	@Excel(name="实际金额",width=15)
	private java.lang.Double cost;
	/**计划单号*/
	@Excel(name="申请单号",width=15,dictTable ="subcontract_plan",dicCode ="plan_no",dicText ="plan_no")
	private java.lang.String planno;
	
	
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
	 *@return: java.lang.String  所属公司
	 */

	@Column(name ="SYS_COMPANY_CODE",nullable=true,length=50)
	public java.lang.String getSysCompanyCode(){
		return this.sysCompanyCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属公司
	 */
	public void setSysCompanyCode(java.lang.String sysCompanyCode){
		this.sysCompanyCode = sysCompanyCode;
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
	 *@return: java.lang.String  产品名称
	 */

	@Column(name ="CPMC",nullable=true,length=32)
	public java.lang.String getCpmc(){
		return this.cpmc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品名称
	 */
	public void setCpmc(java.lang.String cpmc){
		this.cpmc = cpmc;
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
	 *@return: java.lang.String  产品代号
	 */

	@Column(name ="CPDH",nullable=true,length=32)
	public java.lang.String getCpdh(){
		return this.cpdh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品代号
	 */
	public void setCpdh(java.lang.String cpdh){
		this.cpdh = cpdh;
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
	 *@return: java.lang.String  申请人
	 */

	@Column(name ="SQR",nullable=true,length=32)
	public java.lang.String getSqr(){
		return this.sqr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请人
	 */
	public void setSqr(java.lang.String sqr){
		this.sqr = sqr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外包项目
	 */

	@Column(name ="WBXM",nullable=true,length=32)
	public java.lang.String getWbxm(){
		return this.wbxm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外包项目
	 */
	public void setWbxm(java.lang.String wbxm){
		this.wbxm = wbxm;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外包项目其他
	 */

	@Column(name ="WBXMQT",nullable=true,length=32)
	public java.lang.String getWbxmqt(){
		return this.wbxmqt;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外包项目其他
	 */
	public void setWbxmqt(java.lang.String wbxmqt){
		this.wbxmqt = wbxmqt;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  要求完成时间
	 */

	@Column(name ="YQWCSJ",nullable=true,length=32)
	public java.util.Date getYqwcsj(){
		return this.yqwcsj;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  要求完成时间
	 */
	public void setYqwcsj(java.util.Date yqwcsj){
		this.yqwcsj = yqwcsj;
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  预计金额
	 */

	@Column(name ="YJJE",nullable=true,length=32)
	public java.lang.Double getYjje(){
		return this.yjje;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  预计金额
	 */
	public void setYjje(java.lang.Double yjje){
		this.yjje = yjje;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外包供应商
	 */

	@Column(name ="WBGYS",nullable=true,length=32)
	public java.lang.String getWbgys(){
		return this.wbgys;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外包供应商
	 */
	public void setWbgys(java.lang.String wbgys){
		this.wbgys = wbgys;
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  特殊过程标志
	 */

	@Column(name ="SPECIALFLAG",nullable=true,length=32)
	public java.lang.Integer getSpecialflag(){
		return this.specialflag;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  特殊过程标志
	 */
	public void setSpecialflag(java.lang.Integer specialflag){
		this.specialflag = specialflag;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  重要标志
	 */

	@Column(name ="IMPORTANTFLAG",nullable=true,length=32)
	public java.lang.Integer getImportantflag(){
		return this.importantflag;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  重要标志
	 */
	public void setImportantflag(java.lang.Integer importantflag){
		this.importantflag = importantflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  具体外包要求
	 */

	@Column(name ="JTWBYQ",nullable=true,length=32)
	public java.lang.String getJtwbyq(){
		return this.jtwbyq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  具体外包要求
	 */
	public void setJtwbyq(java.lang.String jtwbyq){
		this.jtwbyq = jtwbyq;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  技术文件列表
	 */

	@Column(name ="JSWJLB",nullable=true,length=32)
	public java.lang.String getJswjlb(){
		return this.jswjlb;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  技术文件列表
	 */
	public void setJswjlb(java.lang.String jswjlb){
		this.jswjlb = jswjlb;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门负责人意见
	 */

	@Column(name ="BMFZRYJ",nullable=true,length=32)
	public java.lang.String getBmfzryj(){
		return this.bmfzryj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门负责人意见
	 */
	public void setBmfzryj(java.lang.String bmfzryj){
		this.bmfzryj = bmfzryj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门主管领导意见
	 */

	@Column(name ="BMZGLDYJ",nullable=true,length=32)
	public java.lang.String getBmzgldyj(){
		return this.bmzgldyj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门主管领导意见
	 */
	public void setBmzgldyj(java.lang.String bmzgldyj){
		this.bmzgldyj = bmzgldyj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司领导审批意见
	 */

	@Column(name ="GSLDSPYJ",nullable=true,length=32)
	public java.lang.String getGsldspyj(){
		return this.gsldspyj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司领导审批意见
	 */
	public void setGsldspyj(java.lang.String gsldspyj){
		this.gsldspyj = gsldspyj;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  技术文件列表其他
	 */

	@Column(name ="JSWJLBQT",nullable=true,length=32)
	public java.lang.String getJswjlbqt(){
		return this.jswjlbqt;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  技术文件列表其他
	 */
	public void setJswjlbqt(java.lang.String jswjlbqt){
		this.jswjlbqt = jswjlbqt;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  附件
	 */

	@Column(name ="ATTACH",nullable=true,length=32)
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
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  实际金额
	 */

	@Column(name ="COST",nullable=true,length=32)
	public java.lang.Double getCost(){
		return this.cost;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  实际金额
	 */
	public void setCost(java.lang.Double cost){
		this.cost = cost;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请单号
	 */

	@Column(name ="PLANNO",nullable=true,length=32)
	public java.lang.String getPlanno(){
		return this.planno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请单号
	 */
	public void setPlanno(java.lang.String planno){
		this.planno = planno;
	}
}
