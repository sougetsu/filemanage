package com.jeecg.jianzhi.entity;
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
 * @Description: 监制
 * @author onlineGenerator
 * @date 2020-08-23 13:28:42
 * @version V1.0   
 *
 */
@Entity
@Table(name = "subcontract_jianzhi", schema = "")
@SuppressWarnings("serial")
public class SubcontractJianzhiEntity implements java.io.Serializable {
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
	/**监制报告号*/
	@Excel(name="监制报告号",width=15)
	private java.lang.String jzbgh;
	/**监制单位*/
	@Excel(name="监制单位",width=15)
	private java.lang.String jzdw;
	/**监制数量*/
	@Excel(name="监制数量",width=15)
	private java.lang.String jzsl;
	/**监制时间*/
	@Excel(name="监制时间",width=15)
	private java.lang.String jzsj;
	/**文件id*/
	private java.lang.String fileid;
	/**文件*/
	@Excel(name="文件",width=15)
	private java.lang.String jzfileattach;
	
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
	 *@return: java.lang.String  监制报告号
	 */
	
	@Column(name ="JZBGH",nullable=true,length=32)
	public java.lang.String getJzbgh(){
		return this.jzbgh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  监制报告号
	 */
	public void setJzbgh(java.lang.String jzbgh){
		this.jzbgh = jzbgh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  监制单位
	 */
	
	@Column(name ="JZDW",nullable=true,length=200)
	public java.lang.String getJzdw(){
		return this.jzdw;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  监制单位
	 */
	public void setJzdw(java.lang.String jzdw){
		this.jzdw = jzdw;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  监制数量
	 */
	
	@Column(name ="JZSL",nullable=true,length=32)
	public java.lang.String getJzsl(){
		return this.jzsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  监制数量
	 */
	public void setJzsl(java.lang.String jzsl){
		this.jzsl = jzsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  监制时间
	 */
	
	@Column(name ="JZSJ",nullable=true,length=32)
	public java.lang.String getJzsj(){
		return this.jzsj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  监制时间
	 */
	public void setJzsj(java.lang.String jzsj){
		this.jzsj = jzsj;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  文件id
	 */
	
	@Column(name ="FILEID",nullable=true,length=32)
	public java.lang.String getFileid(){
		return this.fileid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文件id
	 */
	public void setFileid(java.lang.String fileid){
		this.fileid = fileid;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  文件
	 */
	
	@Column(name ="JZFILEATTACH",nullable=true,length=500)
	public java.lang.String getJzfileattach(){
		return this.jzfileattach;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文件
	 */
	public void setJzfileattach(java.lang.String jzfileattach){
		this.jzfileattach = jzfileattach;
	}
	
}
