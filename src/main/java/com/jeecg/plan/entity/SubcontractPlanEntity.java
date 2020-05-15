package com.jeecg.plan.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.lang.String;
import java.lang.Double;
import java.lang.Integer;
import java.math.BigDecimal;
import javax.xml.soap.Text;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 外协计划表
 * @author onlineGenerator
 * @date 2019-04-14 14:54:01
 * @version V1.0   
 *
 */
@Entity
@Table(name = "subcontract_plan", schema = "")
@SuppressWarnings("serial")
public class SubcontractPlanEntity implements java.io.Serializable {
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
	@Excel(name="所属部门",width=15,dictTable ="t_s_depart",dicCode ="id",dicText ="departname")
	private java.lang.String sysOrgCode;
	/**所属公司*/
	private java.lang.String sysCompanyCode;
	/**流程状态*/
	private java.lang.String bpmStatus;
	/**计划投板时间*/
	@Excel(name="计划投板时间",width=15,format = "yyyy-MM-dd")
	private java.util.Date planDate;
	/**电路型号*/
	@Excel(name="电路型号",width=15)
	private java.lang.String dlxh;
	/**计划投板数量*/
	@Excel(name="计划投板数量",width=15)
	private java.lang.Integer planNum;
	/**层数*/
	@Excel(name="层数",width=15)
	private java.lang.String pliesNum;
	/**尺寸*/
	@Excel(name="尺寸",width=15)
	private java.lang.String size;
	/**加工厂商*/
	@Excel(name="加工厂商",width=15,dictTable ="subcontract_supplier",dicCode ="dwmc",dicText ="dwmc")
	private java.lang.String supplier;
	/**计划编号*/
	private java.lang.String planNo;
	/**计划状态*/
	private java.lang.String status;
	
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  计划投板时间
	 */

	@Column(name ="PLAN_DATE",nullable=true,length=32)
	public java.util.Date getPlanDate(){
		return this.planDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  计划投板时间
	 */
	public void setPlanDate(java.util.Date planDate){
		this.planDate = planDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电路型号
	 */

	@Column(name ="DLXH",nullable=true,length=32)
	public java.lang.String getDlxh(){
		return this.dlxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电路型号
	 */
	public void setDlxh(java.lang.String dlxh){
		this.dlxh = dlxh;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  计划投板数量
	 */

	@Column(name ="PLAN_NUM",nullable=true,length=32)
	public java.lang.Integer getPlanNum(){
		return this.planNum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  计划投板数量
	 */
	public void setPlanNum(java.lang.Integer planNum){
		this.planNum = planNum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  层数
	 */

	@Column(name ="PLIES_NUM",nullable=true,length=32)
	public java.lang.String getPliesNum(){
		return this.pliesNum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  层数
	 */
	public void setPliesNum(java.lang.String pliesNum){
		this.pliesNum = pliesNum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  尺寸
	 */

	@Column(name ="SIZE",nullable=true,length=32)
	public java.lang.String getSize(){
		return this.size;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  尺寸
	 */
	public void setSize(java.lang.String size){
		this.size = size;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  加工厂商
	 */

	@Column(name ="SUPPLIER",nullable=true,length=32)
	public java.lang.String getSupplier(){
		return this.supplier;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  加工厂商
	 */
	public void setSupplier(java.lang.String supplier){
		this.supplier = supplier;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  计划编号
	 */

	@Column(name ="PLAN_NO",nullable=true,length=32)
	public java.lang.String getPlanNo(){
		return this.planNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  计划编号
	 */
	public void setPlanNo(java.lang.String planNo){
		this.planNo = planNo;
	}

	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	
	
}