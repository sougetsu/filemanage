package com.jeecg.productinfo.entity;

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
 * @Description: 产品基础信息
 * @author onlineGenerator
 * @date 2019-12-21 16:36:12
 * @version V1.0   
 *
 */
@Entity
@Table(name = "cer_product_info", schema = "")
@SuppressWarnings("serial")
public class CerProductInfoEntity implements java.io.Serializable {
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
	/**产品型号*/
	@Excel(name="产品型号",width=15)
	private java.lang.String cpxh;
	/**产品批次*/
	@Excel(name="产品批次",width=15)
	private java.lang.String cppc;
	/**产品名称*/
	@Excel(name="产品名称",width=15)
	private java.lang.String cpmc;
	/**产品数量*/
	@Excel(name="产品数量",width=15)
	private java.lang.String cpsl;
	/**产品检测标准*/
	@Excel(name="产品检测标准",width=15)
	private java.lang.String cpjcbz;
	/**检测报告号*/
	@Excel(name="检测报告号",width=15)
	private java.lang.String jcbgh;
	
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
	 *@return: java.lang.String  产品型号
	 */

	@Column(name ="CPXH",nullable=false,length=32)
	public java.lang.String getCpxh(){
		return this.cpxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品型号
	 */
	public void setCpxh(java.lang.String cpxh){
		this.cpxh = cpxh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品批次
	 */

	@Column(name ="CPPC",nullable=false,length=32)
	public java.lang.String getCppc(){
		return this.cppc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品批次
	 */
	public void setCppc(java.lang.String cppc){
		this.cppc = cppc;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品名称
	 */

	@Column(name ="CPMC",nullable=false,length=32)
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
	 *@return: java.lang.String  产品数量
	 */

	@Column(name ="CPSL",nullable=false,length=32)
	public java.lang.String getCpsl(){
		return this.cpsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品数量
	 */
	public void setCpsl(java.lang.String cpsl){
		this.cpsl = cpsl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品检测标准
	 */

	@Column(name ="CPJCBZ",nullable=false,length=32)
	public java.lang.String getCpjcbz(){
		return this.cpjcbz;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品检测标准
	 */
	public void setCpjcbz(java.lang.String cpjcbz){
		this.cpjcbz = cpjcbz;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  检测报告号
	 */

	@Column(name ="JCBGH",nullable=true,length=32)
	public java.lang.String getJcbgh(){
		return this.jcbgh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  检测报告号
	 */
	public void setJcbgh(java.lang.String jcbgh){
		this.jcbgh = jcbgh;
	}
}
