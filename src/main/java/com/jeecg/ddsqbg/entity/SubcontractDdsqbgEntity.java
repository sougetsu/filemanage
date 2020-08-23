package com.jeecg.ddsqbg.entity;
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
 * @Description: 单独水汽报告
 * @author onlineGenerator
 * @date 2020-08-23 13:28:41
 * @version V1.0   
 *
 */
@Entity
@Table(name = "subcontract_ddsqbg", schema = "")
@SuppressWarnings("serial")
public class SubcontractDdsqbgEntity implements java.io.Serializable {
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
	/**单独水汽报告号*/
	@Excel(name="单独水汽报告号",width=15)
	private java.lang.String ddsqbgh;
	/**水汽检测机构*/
	@Excel(name="水汽检测机构",width=15)
	private java.lang.String sqjcjg;
	/**水汽检测开始时间*/
	@Excel(name="水汽检测开始时间",width=15)
	private java.lang.String sqjcstarttime;
	/**水汽检测结束时间*/
	@Excel(name="水汽检测结束时间",width=15)
	private java.lang.String sqjcendtime;
	/**文件id*/
	private java.lang.String fileid;
	/**文件上传*/
	@Excel(name="文件上传",width=15)
	private java.lang.String fileattach;
	
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
	 *@return: java.lang.String  单独水汽报告号
	 */
	
	@Column(name ="DDSQBGH",nullable=true,length=32)
	public java.lang.String getDdsqbgh(){
		return this.ddsqbgh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单独水汽报告号
	 */
	public void setDdsqbgh(java.lang.String ddsqbgh){
		this.ddsqbgh = ddsqbgh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  水汽检测机构
	 */
	
	@Column(name ="SQJCJG",nullable=true,length=200)
	public java.lang.String getSqjcjg(){
		return this.sqjcjg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  水汽检测机构
	 */
	public void setSqjcjg(java.lang.String sqjcjg){
		this.sqjcjg = sqjcjg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  水汽检测开始时间
	 */
	
	@Column(name ="SQJCSTARTTIME",nullable=true,length=32)
	public java.lang.String getSqjcstarttime(){
		return this.sqjcstarttime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  水汽检测开始时间
	 */
	public void setSqjcstarttime(java.lang.String sqjcstarttime){
		this.sqjcstarttime = sqjcstarttime;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  水汽检测结束时间
	 */
	
	@Column(name ="SQJCENDTIME",nullable=true,length=32)
	public java.lang.String getSqjcendtime(){
		return this.sqjcendtime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  水汽检测结束时间
	 */
	public void setSqjcendtime(java.lang.String sqjcendtime){
		this.sqjcendtime = sqjcendtime;
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
	 *@return: java.lang.String  文件上传
	 */
	
	@Column(name ="FILEATTACH",nullable=true,length=500)
	public java.lang.String getFileattach(){
		return this.fileattach;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文件上传
	 */
	public void setFileattach(java.lang.String fileattach){
		this.fileattach = fileattach;
	}
	
}
