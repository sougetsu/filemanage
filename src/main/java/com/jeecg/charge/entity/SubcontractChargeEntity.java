package com.jeecg.charge.entity;

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
 * @Description: 挂账记录表
 * @author onlineGenerator
 * @date 2019-10-04 12:28:12
 * @version V1.0   
 *
 */
@Entity
@Table(name = "subcontract_charge", schema = "")
@SuppressWarnings("serial")
public class SubcontractChargeEntity implements java.io.Serializable {
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
	/**所属公司*/
	private java.lang.String sysCompanyCode;
	/**流程状态*/
	private java.lang.String bpmStatus;
	/**付款单位*/
	@Excel(name="付款单位",width=15)
	private java.lang.String payCompany;
	/**收款单位*/
	@Excel(name="收款单位",width=15)
	private java.lang.String collectionCompany;
	/**付款事项*/
	@Excel(name="付款事项",width=15)
	private java.lang.String payReason;
	/**付款金额*/
	@Excel(name="付款金额",width=15)
	private java.lang.Double payCount;
	/**付款日期*/
	@Excel(name="付款日期",width=15,format = "yyyy-MM-dd")
	private java.util.Date payDate;
	/**课题号*/
	@Excel(name="课题号",width=15)
	private java.lang.String kth;
	/**支付方式*/
	@Excel(name="支付方式",width=15)
	private java.lang.String payType;
	/**备注*/
	@Excel(name="备注",width=15)
	private java.lang.String remark;
	/**状态*/
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  付款单位
	 */

	@Column(name ="PAY_COMPANY",nullable=true,length=100)
	public java.lang.String getPayCompany(){
		return this.payCompany;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  付款单位
	 */
	public void setPayCompany(java.lang.String payCompany){
		this.payCompany = payCompany;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  收款单位
	 */

	@Column(name ="COLLECTION_COMPANY",nullable=true,length=32)
	public java.lang.String getCollectionCompany(){
		return this.collectionCompany;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  收款单位
	 */
	public void setCollectionCompany(java.lang.String collectionCompany){
		this.collectionCompany = collectionCompany;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  付款事项
	 */

	@Column(name ="PAY_REASON",nullable=true,length=32)
	public java.lang.String getPayReason(){
		return this.payReason;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  付款事项
	 */
	public void setPayReason(java.lang.String payReason){
		this.payReason = payReason;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  付款金额
	 */

	@Column(name ="PAY_COUNT",nullable=true,length=32)
	public java.lang.Double getPayCount(){
		return this.payCount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  付款金额
	 */
	public void setPayCount(java.lang.Double payCount){
		this.payCount = payCount;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  付款日期
	 */

	@Column(name ="PAY_DATE",nullable=true,length=32)
	public java.util.Date getPayDate(){
		return this.payDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  付款日期
	 */
	public void setPayDate(java.util.Date payDate){
		this.payDate = payDate;
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
	 *@return: java.lang.String  支付方式
	 */

	@Column(name ="PAY_TYPE",nullable=true,length=32)
	public java.lang.String getPayType(){
		return this.payType;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  支付方式
	 */
	public void setPayType(java.lang.String payType){
		this.payType = payType;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */

	@Column(name ="REMARK",nullable=true,length=500)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */

	@Column(name ="STATUS",nullable=true,length=32)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
}