package com.jeecg.sxbhgqk.entity;
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
 * @Description: 筛选不合格情况
 * @author onlineGenerator
 * @date 2020-08-23 13:28:42
 * @version V1.0   
 *
 */
@Entity
@Table(name = "subcontract_sxbhgqk", schema = "")
@SuppressWarnings("serial")
public class SubcontractSxbhgqkEntity implements java.io.Serializable {
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
	/**PIND*/
	@Excel(name="PIND",width=15)
	private java.lang.String sxbhgpind;
	/**老炼前电测试*/
	@Excel(name="老炼前电测试",width=15)
	private java.lang.String sxllqdcs;
	/**动态老炼后电测试*/
	@Excel(name="动态老炼后电测试",width=15)
	private java.lang.String sxdtllhdcs;
	/**静态老炼后电测试*/
	@Excel(name="静态老炼后电测试",width=15)
	private java.lang.String sxjtllhdcs;
	/**最终电测试*/
	@Excel(name="最终电测试",width=15)
	private java.lang.String sxzzdcs;
	/**细检漏*/
	@Excel(name="细检漏",width=15)
	private java.lang.String sxxjl;
	/**粗检漏*/
	@Excel(name="粗检漏",width=15)
	private java.lang.String sxcjl;
	/**X射线*/
	@Excel(name="X射线",width=15)
	private java.lang.String sxxsx;
	/**外部目检*/
	@Excel(name="外部目检",width=15)
	private java.lang.String sxwbmj;
	/**文件id*/
	@Excel(name="文件id",width=15)
	private java.lang.String fileid;
	
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
	 *@return: java.lang.String  PIND
	 */
	
	@Column(name ="SXBHGPIND",nullable=true,length=32)
	public java.lang.String getSxbhgpind(){
		return this.sxbhgpind;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  PIND
	 */
	public void setSxbhgpind(java.lang.String sxbhgpind){
		this.sxbhgpind = sxbhgpind;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  老炼前电测试
	 */
	
	@Column(name ="SXLLQDCS",nullable=true,length=32)
	public java.lang.String getSxllqdcs(){
		return this.sxllqdcs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  老炼前电测试
	 */
	public void setSxllqdcs(java.lang.String sxllqdcs){
		this.sxllqdcs = sxllqdcs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  动态老炼后电测试
	 */
	
	@Column(name ="SXDTLLHDCS",nullable=true,length=32)
	public java.lang.String getSxdtllhdcs(){
		return this.sxdtllhdcs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  动态老炼后电测试
	 */
	public void setSxdtllhdcs(java.lang.String sxdtllhdcs){
		this.sxdtllhdcs = sxdtllhdcs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  静态老炼后电测试
	 */
	
	@Column(name ="SXJTLLHDCS",nullable=true,length=32)
	public java.lang.String getSxjtllhdcs(){
		return this.sxjtllhdcs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  静态老炼后电测试
	 */
	public void setSxjtllhdcs(java.lang.String sxjtllhdcs){
		this.sxjtllhdcs = sxjtllhdcs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  最终电测试
	 */
	
	@Column(name ="SXZZDCS",nullable=true,length=32)
	public java.lang.String getSxzzdcs(){
		return this.sxzzdcs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  最终电测试
	 */
	public void setSxzzdcs(java.lang.String sxzzdcs){
		this.sxzzdcs = sxzzdcs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  细检漏
	 */
	
	@Column(name ="SXXJL",nullable=true,length=32)
	public java.lang.String getSxxjl(){
		return this.sxxjl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  细检漏
	 */
	public void setSxxjl(java.lang.String sxxjl){
		this.sxxjl = sxxjl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  粗检漏
	 */
	
	@Column(name ="SXCJL",nullable=true,length=32)
	public java.lang.String getSxcjl(){
		return this.sxcjl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  粗检漏
	 */
	public void setSxcjl(java.lang.String sxcjl){
		this.sxcjl = sxcjl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  X射线
	 */
	
	@Column(name ="SXXSX",nullable=true,length=32)
	public java.lang.String getSxxsx(){
		return this.sxxsx;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  X射线
	 */
	public void setSxxsx(java.lang.String sxxsx){
		this.sxxsx = sxxsx;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外部目检
	 */
	
	@Column(name ="SXWBMJ",nullable=true,length=32)
	public java.lang.String getSxwbmj(){
		return this.sxwbmj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外部目检
	 */
	public void setSxwbmj(java.lang.String sxwbmj){
		this.sxwbmj = sxwbmj;
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
	
}
