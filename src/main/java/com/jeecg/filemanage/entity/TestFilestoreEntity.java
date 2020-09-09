package com.jeecg.filemanage.entity;
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
 * @Description: 文件管理
 * @author onlineGenerator
 * @date 2020-08-23 21:33:13
 * @version V1.0   
 *
 */
@Entity
@Table(name = "test_filestore", schema = "")
@SuppressWarnings("serial")
public class TestFilestoreEntity implements java.io.Serializable {
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
	/**阶段标识*/
	@Excel(name="阶段标识",width=15,dicCode="filestatus")
	private java.lang.String bpmStatus;
	/**产品名称*/
	@Excel(name="产品名称",width=15)
	private java.lang.String dlmc;
	/**产品型号*/
	@Excel(name="型号",width=15)
	private java.lang.String xh;
	/**产品批次*/
	@Excel(name="产品批次",width=15)
	private java.lang.String pc;
	/**任务通知单号*/
	@Excel(name="任务通知单号",width=15)
	private java.lang.String rwtzdh;
	/**任务数量*/
	@Excel(name="任务数量",width=15)
	private java.lang.String rwsl;
	/**执行规范号*/
	@Excel(name="执行规范号",width=15)
	private java.lang.String zxgfh;
	/**质量等级*/
	@Excel(name="质量等级",width=15)
	private java.lang.String zldj;
	/**封装形式*/
	@Excel(name="封装形式",width=15)
	private java.lang.String fzxs;
	/**芯片标识*/
	@Excel(name="芯片标识",width=15)
	private java.lang.String xpbs;
	/**圆片批次*/
	@Excel(name="圆片批次",width=15)
	private java.lang.String yppc;
	/**圆片号*/
	@Excel(name="圆片号",width=15)
	private java.lang.String yph;
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
	/**外壳型号*/
	@Excel(name="外壳型号",width=15)
	private java.lang.String wjxh;
	/**外壳检验批次*/
	@Excel(name="外壳检验批次",width=15)
	private java.lang.String wkjypc;
	/**盖板型号*/
	@Excel(name="盖板型号",width=15)
	private java.lang.String gbxh;
	/**盖板检验批次*/
	@Excel(name="盖板检验批次",width=15)
	private java.lang.String gbjypc;
	/**键合丝型号*/
	@Excel(name="键合丝型号",width=15)
	private java.lang.String jhsxh;
	/**键合丝检验批次*/
	@Excel(name="键合丝检验批次",width=15)
	private java.lang.String jhsjypc;
	/**粘片胶型号*/
	@Excel(name="粘片胶型号",width=15)
	private java.lang.String zpjxh;
	/**粘片胶检验批次*/
	@Excel(name="粘片胶检验批次",width=15)
	private java.lang.String zpjyjpc;
	/**打标墨型号*/
	@Excel(name="打标墨型号",width=15)
	private java.lang.String dbmxh;
	/**打标墨检验批次*/
	@Excel(name="打标墨检验批次",width=15)
	private java.lang.String dbmjypc;
	/**腔体体积*/
	@Excel(name="腔体体积cm 3",width=15)
	private java.lang.String qttj;
	/**腔体高度*/
	@Excel(name="腔体高度mm",width=15)
	private java.lang.String qtgd;
	/**投入封装数量*/
	@Excel(name="投入封装数量",width=15)
	private java.lang.String trfzsl;
	/**封装合格数量*/
	@Excel(name="封装合格数量",width=15)
	private java.lang.String fzhgsl;
	/**监制电路起止序号*/
	@Excel(name="监制电路起止序号",width=15)
	private java.lang.String jzdlqzxh;
	/**封装不合格情况*/
	@Excel(name="封装不合格情况",width=15)
	private java.lang.String fzbhgqk;
	/**筛选报告附件*/
	@Excel(name="筛选报告附件",width=15)
	private java.lang.String sxbghfile;
	/**筛选过程PIND次数*/
	@Excel(name="筛选过程PIND次数",width=15)
	private java.lang.String sxgcpindcs;
	/**投入筛选数量*/
	@Excel(name="投入筛选数量",width=15)
	private java.lang.String trsxsl;
	/**筛选合格数量*/
	@Excel(name="筛选合格数量",width=15)
	private java.lang.String sxhgsl;
	/**筛选不合格情况*/
	@Excel(name="筛选不合格情况",width=15)
	private java.lang.String sxbhgqk;
	/**PDA*/
	@Excel(name="PDA",width=15)
	private java.lang.String pda;
	/**成品率*/
	@Excel(name="成品率",width=15)
	private java.lang.String cpl;
	/**X光盘*/
	@Excel(name="X光盘",width=15)
	private java.lang.String xgp;
	/**测试光盘*/
	@Excel(name="测试光盘",width=15)
	private java.lang.String csgp;
	/**报告*/
	@Excel(name="报告",width=15)
	private java.lang.String threebg;
	/**低成品率质量分析报告*/
	@Excel(name="低成品率质量分析报告",width=15)
	private java.lang.String dcplzlfxbg;
	/**鉴定一致性检验方式*/
	@Excel(name="鉴定一致性检验方式",width=15)
	private java.lang.String jdfs;
	/**鉴定一致性检验报告附件*/
	@Excel(name="鉴定一致性检验报告附件",width=15)
	private java.lang.String jdbgbhfile;
	/**鉴定一致性检验起止时间*/
	@Excel(name="鉴定一致性检验起止时间",width=15)
	private java.lang.String jdqzsj;
	/**首件鉴定报告*/
	@Excel(name="首件鉴定报告",width=15)
	private java.lang.String sjjdbg;
	/**首件鉴定目录*/
	@Excel(name="首件鉴定目录",width=15)
	private java.lang.String sjjdml;
	/**用户评审意见*/
	@Excel(name="用户评审意见",width=15)
	private java.lang.String yhpsyj;
	/**质量评审*/
	@Excel(name="质量评审",width=15)
	private java.lang.String zlps;
	/**ESD报告记录*/
	@Excel(name="ESD报告记录",width=15)
	private java.lang.String esd;
	/**抗闩锁报告记录*/
	@Excel(name="抗闩锁报告记录",width=15)
	private java.lang.String kss;
	/**总剂量报告*/
	@Excel(name="总剂量报告",width=15)
	private java.lang.String zjl;
	/**单粒子报告*/
	@Excel(name="单粒子报告",width=15)
	private java.lang.String dlz;
	/**寿命后水汽报告记录*/
	@Excel(name="寿命后水汽报告记录",width=15)
	private java.lang.String smhsq;
	/**筛合水汽报告记录*/
	@Excel(name="筛合水汽报告记录",width=15)
	private java.lang.String shsq;
	/**补充检验报告*/
	@Excel(name="补充检验报告",width=15)
	private java.lang.String bcjybg;
	/**单批质保报告*/
	@Excel(name="单批质保报告",width=15)
	private java.lang.String dpzbbg;
	/**归档卷宗号*/
	@Excel(name="归档卷宗号",width=15)
	private java.lang.String gdjzh;
	/**其他信息附件*/
	@Excel(name="其他信息附件",width=15)
	private java.lang.String otherfileattach;
	/**抗闩锁方案*/
	@Excel(name="抗闩锁方案",width=15)
	private java.lang.String kssfa;
	/**总剂量方案*/
	@Excel(name="总剂量方案",width=15)
	private java.lang.String zjlfa;
	/**单粒子方案*/
	@Excel(name="单粒子方案",width=15)
	private java.lang.String dlzfa;
	/**鉴定一致性自定义上传*/
	@Excel(name="鉴定一致性自定义上传",width=15)
	private java.lang.String jdyzzdy;
	/**PIND不合格数*/
	@Excel(name="PIND不合格数",width=15)
	private java.lang.String pindbhgs;
	/**PIND分析报告*/
	@Excel(name="PIND分析报告",width=15)
	private java.lang.String pindfxbg;
	/**投入测试数量*/
	@Excel(name="投入测试数量",width=15)
	private java.lang.String fzhtrcssl;
	/**测试合格数量*/
	@Excel(name="测试合格数量",width=15)
	private java.lang.String fzhcshgsl;
	/**封装后测试成品率*/
	@Excel(name="封装后测试成品率",width=15)
	private java.lang.String fzhcscpl;
	/**封装成品率*/
	@Excel(name="封装成品率%",width=15)
	private java.lang.String fzcpl;
	/**筛选报告号*/
	@Excel(name="筛选报告号",width=15)
	private java.lang.String sxbgh;
	/**鉴定一致性检验报告编号*/
	@Excel(name="鉴定一致性检验报告编号",width=15)
	private java.lang.String jdyzxjybgh;
	/**筛选开始时间*/
	@Excel(name="筛选开始时间",width=15)
	private java.lang.String sxstarttime;
	/**筛选结束时间*/
	@Excel(name="筛选结束时间",width=15)
	private java.lang.String sxendtime;
	
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
	 *@return: java.lang.String  阶段标识
	 */
	
	@Column(name ="BPM_STATUS",nullable=true,length=32)
	public java.lang.String getBpmStatus(){
		return this.bpmStatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  阶段标识
	 */
	public void setBpmStatus(java.lang.String bpmStatus){
		this.bpmStatus = bpmStatus;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  型号
	 */
	
	@Column(name ="XH",nullable=true,length=32)
	public java.lang.String getXh(){
		return this.xh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  型号
	 */
	public void setXh(java.lang.String xh){
		this.xh = xh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电路名称
	 */
	
	@Column(name ="DLMC",nullable=true,length=100)
	public java.lang.String getDlmc(){
		return this.dlmc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电路名称
	 */
	public void setDlmc(java.lang.String dlmc){
		this.dlmc = dlmc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  批次
	 */
	
	@Column(name ="PC",nullable=true,length=32)
	public java.lang.String getPc(){
		return this.pc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  批次
	 */
	public void setPc(java.lang.String pc){
		this.pc = pc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  任务通知单号
	 */
	
	@Column(name ="RWTZDH",nullable=true,length=50)
	public java.lang.String getRwtzdh(){
		return this.rwtzdh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  任务通知单号
	 */
	public void setRwtzdh(java.lang.String rwtzdh){
		this.rwtzdh = rwtzdh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  任务数量
	 */
	
	@Column(name ="RWSL",nullable=true,length=32)
	public java.lang.String getRwsl(){
		return this.rwsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  任务数量
	 */
	public void setRwsl(java.lang.String rwsl){
		this.rwsl = rwsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  执行规范号
	 */
	
	@Column(name ="ZXGFH",nullable=true,length=32)
	public java.lang.String getZxgfh(){
		return this.zxgfh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  执行规范号
	 */
	public void setZxgfh(java.lang.String zxgfh){
		this.zxgfh = zxgfh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  质量等级
	 */
	
	@Column(name ="ZLDJ",nullable=true,length=32)
	public java.lang.String getZldj(){
		return this.zldj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  质量等级
	 */
	public void setZldj(java.lang.String zldj){
		this.zldj = zldj;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  封装形式
	 */
	
	@Column(name ="FZXS",nullable=true,length=50)
	public java.lang.String getFzxs(){
		return this.fzxs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  封装形式
	 */
	public void setFzxs(java.lang.String fzxs){
		this.fzxs = fzxs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  芯片标识
	 */
	
	@Column(name ="XPBS",nullable=true,length=50)
	public java.lang.String getXpbs(){
		return this.xpbs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  芯片标识
	 */
	public void setXpbs(java.lang.String xpbs){
		this.xpbs = xpbs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  圆片批次
	 */
	
	@Column(name ="YPPC",nullable=true,length=32)
	public java.lang.String getYppc(){
		return this.yppc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  圆片批次
	 */
	public void setYppc(java.lang.String yppc){
		this.yppc = yppc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  圆片号
	 */
	
	@Column(name ="YPH",nullable=true,length=32)
	public java.lang.String getYph(){
		return this.yph;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  圆片号
	 */
	public void setYph(java.lang.String yph){
		this.yph = yph;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  监制报告号
	 */
	
	@Column(name ="JZBGH",nullable=true,length=200)
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
	
	@Column(name ="JZDW",nullable=true,length=100)
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
	 *@return: java.lang.String  外壳型号
	 */
	
	@Column(name ="WJXH",nullable=true,length=32)
	public java.lang.String getWjxh(){
		return this.wjxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外壳型号
	 */
	public void setWjxh(java.lang.String wjxh){
		this.wjxh = wjxh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  外壳检验批次
	 */
	
	@Column(name ="WKJYPC",nullable=true,length=32)
	public java.lang.String getWkjypc(){
		return this.wkjypc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  外壳检验批次
	 */
	public void setWkjypc(java.lang.String wkjypc){
		this.wkjypc = wkjypc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  盖板型号
	 */
	
	@Column(name ="GBXH",nullable=true,length=32)
	public java.lang.String getGbxh(){
		return this.gbxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  盖板型号
	 */
	public void setGbxh(java.lang.String gbxh){
		this.gbxh = gbxh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  盖板检验批次
	 */
	
	@Column(name ="GBJYPC",nullable=true,length=32)
	public java.lang.String getGbjypc(){
		return this.gbjypc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  盖板检验批次
	 */
	public void setGbjypc(java.lang.String gbjypc){
		this.gbjypc = gbjypc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  键合丝型号
	 */
	
	@Column(name ="JHSXH",nullable=true,length=32)
	public java.lang.String getJhsxh(){
		return this.jhsxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  键合丝型号
	 */
	public void setJhsxh(java.lang.String jhsxh){
		this.jhsxh = jhsxh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  键合丝检验批次
	 */
	
	@Column(name ="JHSJYPC",nullable=true,length=32)
	public java.lang.String getJhsjypc(){
		return this.jhsjypc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  键合丝检验批次
	 */
	public void setJhsjypc(java.lang.String jhsjypc){
		this.jhsjypc = jhsjypc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  粘片胶型号
	 */
	
	@Column(name ="ZPJXH",nullable=true,length=32)
	public java.lang.String getZpjxh(){
		return this.zpjxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  粘片胶型号
	 */
	public void setZpjxh(java.lang.String zpjxh){
		this.zpjxh = zpjxh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  粘片胶检验批次
	 */
	
	@Column(name ="ZPJYJPC",nullable=true,length=32)
	public java.lang.String getZpjyjpc(){
		return this.zpjyjpc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  粘片胶检验批次
	 */
	public void setZpjyjpc(java.lang.String zpjyjpc){
		this.zpjyjpc = zpjyjpc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  打标墨型号
	 */
	
	@Column(name ="DBMXH",nullable=true,length=32)
	public java.lang.String getDbmxh(){
		return this.dbmxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  打标墨型号
	 */
	public void setDbmxh(java.lang.String dbmxh){
		this.dbmxh = dbmxh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  打标墨检验批次
	 */
	
	@Column(name ="DBMJYPC",nullable=true,length=32)
	public java.lang.String getDbmjypc(){
		return this.dbmjypc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  打标墨检验批次
	 */
	public void setDbmjypc(java.lang.String dbmjypc){
		this.dbmjypc = dbmjypc;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  腔体体积
	 */
	
	@Column(name ="QTTJ",nullable=true,length=32)
	public java.lang.String getQttj(){
		return this.qttj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  腔体体积
	 */
	public void setQttj(java.lang.String qttj){
		this.qttj = qttj;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  腔体高度
	 */
	
	@Column(name ="QTGD",nullable=true,length=32)
	public java.lang.String getQtgd(){
		return this.qtgd;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  腔体高度
	 */
	public void setQtgd(java.lang.String qtgd){
		this.qtgd = qtgd;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  投入封装数量
	 */
	
	@Column(name ="TRFZSL",nullable=true,length=32)
	public java.lang.String getTrfzsl(){
		return this.trfzsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  投入封装数量
	 */
	public void setTrfzsl(java.lang.String trfzsl){
		this.trfzsl = trfzsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  封装合格数量
	 */
	
	@Column(name ="FZHGSL",nullable=true,length=32)
	public java.lang.String getFzhgsl(){
		return this.fzhgsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  封装合格数量
	 */
	public void setFzhgsl(java.lang.String fzhgsl){
		this.fzhgsl = fzhgsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  监制电路起止序号
	 */
	
	@Column(name ="JZDLQZXH",nullable=true,length=32)
	public java.lang.String getJzdlqzxh(){
		return this.jzdlqzxh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  监制电路起止序号
	 */
	public void setJzdlqzxh(java.lang.String jzdlqzxh){
		this.jzdlqzxh = jzdlqzxh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  封装不合格情况
	 */
	
	@Column(name ="FZBHGQK",nullable=true,length=200)
	public java.lang.String getFzbhgqk(){
		return this.fzbhgqk;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  封装不合格情况
	 */
	public void setFzbhgqk(java.lang.String fzbhgqk){
		this.fzbhgqk = fzbhgqk;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选报告附件
	 */
	
	@Column(name ="SXBGHFILE",nullable=true,length=200)
	public java.lang.String getSxbghfile(){
		return this.sxbghfile;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选报告附件
	 */
	public void setSxbghfile(java.lang.String sxbghfile){
		this.sxbghfile = sxbghfile;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选过程PIND次数
	 */
	
	@Column(name ="SXGCPINDCS",nullable=true,length=32)
	public java.lang.String getSxgcpindcs(){
		return this.sxgcpindcs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选过程PIND次数
	 */
	public void setSxgcpindcs(java.lang.String sxgcpindcs){
		this.sxgcpindcs = sxgcpindcs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  投入筛选数量
	 */
	
	@Column(name ="TRSXSL",nullable=true,length=32)
	public java.lang.String getTrsxsl(){
		return this.trsxsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  投入筛选数量
	 */
	public void setTrsxsl(java.lang.String trsxsl){
		this.trsxsl = trsxsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选合格数量
	 */
	
	@Column(name ="SXHGSL",nullable=true,length=32)
	public java.lang.String getSxhgsl(){
		return this.sxhgsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选合格数量
	 */
	public void setSxhgsl(java.lang.String sxhgsl){
		this.sxhgsl = sxhgsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选不合格情况
	 */
	
	@Column(name ="SXBHGQK",nullable=true,length=200)
	public java.lang.String getSxbhgqk(){
		return this.sxbhgqk;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选不合格情况
	 */
	public void setSxbhgqk(java.lang.String sxbhgqk){
		this.sxbhgqk = sxbhgqk;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  PDA
	 */
	
	@Column(name ="PDA",nullable=true,length=200)
	public java.lang.String getPda(){
		return this.pda;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  PDA
	 */
	public void setPda(java.lang.String pda){
		this.pda = pda;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  成品率
	 */
	
	@Column(name ="CPL",nullable=true,length=32)
	public java.lang.String getCpl(){
		return this.cpl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  成品率
	 */
	public void setCpl(java.lang.String cpl){
		this.cpl = cpl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  X光盘
	 */
	
	@Column(name ="XGP",nullable=true,length=200)
	public java.lang.String getXgp(){
		return this.xgp;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  X光盘
	 */
	public void setXgp(java.lang.String xgp){
		this.xgp = xgp;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  测试光盘
	 */
	
	@Column(name ="CSGP",nullable=true,length=200)
	public java.lang.String getCsgp(){
		return this.csgp;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  测试光盘
	 */
	public void setCsgp(java.lang.String csgp){
		this.csgp = csgp;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  报告
	 */
	
	@Column(name ="THREEBG",nullable=true,length=200)
	public java.lang.String getThreebg(){
		return this.threebg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  报告
	 */
	public void setThreebg(java.lang.String threebg){
		this.threebg = threebg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  低成品率质量分析报告
	 */
	
	@Column(name ="DCPLZLFXBG",nullable=true,length=200)
	public java.lang.String getDcplzlfxbg(){
		return this.dcplzlfxbg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  低成品率质量分析报告
	 */
	public void setDcplzlfxbg(java.lang.String dcplzlfxbg){
		this.dcplzlfxbg = dcplzlfxbg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  鉴定一致性检验方式
	 */
	
	@Column(name ="JDFS",nullable=true,length=200)
	public java.lang.String getJdfs(){
		return this.jdfs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  鉴定一致性检验方式
	 */
	public void setJdfs(java.lang.String jdfs){
		this.jdfs = jdfs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  鉴定一致性检验报告附件
	 */
	
	@Column(name ="JDBGBHFILE",nullable=true,length=200)
	public java.lang.String getJdbgbhfile(){
		return this.jdbgbhfile;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  鉴定一致性检验报告附件
	 */
	public void setJdbgbhfile(java.lang.String jdbgbhfile){
		this.jdbgbhfile = jdbgbhfile;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  鉴定一致性检验起止时间
	 */
	
	@Column(name ="JDQZSJ",nullable=true,length=32)
	public java.lang.String getJdqzsj(){
		return this.jdqzsj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  鉴定一致性检验起止时间
	 */
	public void setJdqzsj(java.lang.String jdqzsj){
		this.jdqzsj = jdqzsj;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  首件鉴定报告
	 */
	
	@Column(name ="SJJDBG",nullable=true,length=200)
	public java.lang.String getSjjdbg(){
		return this.sjjdbg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  首件鉴定报告
	 */
	public void setSjjdbg(java.lang.String sjjdbg){
		this.sjjdbg = sjjdbg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  首件鉴定目录
	 */
	
	@Column(name ="SJJDML",nullable=true,length=200)
	public java.lang.String getSjjdml(){
		return this.sjjdml;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  首件鉴定目录
	 */
	public void setSjjdml(java.lang.String sjjdml){
		this.sjjdml = sjjdml;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户评审意见
	 */
	
	@Column(name ="YHPSYJ",nullable=true,length=200)
	public java.lang.String getYhpsyj(){
		return this.yhpsyj;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户评审意见
	 */
	public void setYhpsyj(java.lang.String yhpsyj){
		this.yhpsyj = yhpsyj;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  质量评审
	 */
	
	@Column(name ="ZLPS",nullable=true,length=200)
	public java.lang.String getZlps(){
		return this.zlps;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  质量评审
	 */
	public void setZlps(java.lang.String zlps){
		this.zlps = zlps;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ESD报告记录
	 */
	
	@Column(name ="ESD",nullable=true,length=200)
	public java.lang.String getEsd(){
		return this.esd;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ESD报告记录
	 */
	public void setEsd(java.lang.String esd){
		this.esd = esd;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  抗闩锁报告记录
	 */
	
	@Column(name ="KSS",nullable=true,length=200)
	public java.lang.String getKss(){
		return this.kss;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  抗闩锁报告记录
	 */
	public void setKss(java.lang.String kss){
		this.kss = kss;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  总剂量报告
	 */
	
	@Column(name ="ZJL",nullable=true,length=200)
	public java.lang.String getZjl(){
		return this.zjl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  总剂量报告
	 */
	public void setZjl(java.lang.String zjl){
		this.zjl = zjl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单粒子报告
	 */
	
	@Column(name ="DLZ",nullable=true,length=200)
	public java.lang.String getDlz(){
		return this.dlz;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单粒子报告
	 */
	public void setDlz(java.lang.String dlz){
		this.dlz = dlz;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  寿命后水汽报告记录
	 */
	
	@Column(name ="SMHSQ",nullable=true,length=200)
	public java.lang.String getSmhsq(){
		return this.smhsq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  寿命后水汽报告记录
	 */
	public void setSmhsq(java.lang.String smhsq){
		this.smhsq = smhsq;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛合水汽报告记录
	 */
	
	@Column(name ="SHSQ",nullable=true,length=200)
	public java.lang.String getShsq(){
		return this.shsq;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛合水汽报告记录
	 */
	public void setShsq(java.lang.String shsq){
		this.shsq = shsq;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  补充检验报告
	 */
	
	@Column(name ="BCJYBG",nullable=true,length=200)
	public java.lang.String getBcjybg(){
		return this.bcjybg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  补充检验报告
	 */
	public void setBcjybg(java.lang.String bcjybg){
		this.bcjybg = bcjybg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单批质保报告
	 */
	
	@Column(name ="DPZBBG",nullable=true,length=200)
	public java.lang.String getDpzbbg(){
		return this.dpzbbg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单批质保报告
	 */
	public void setDpzbbg(java.lang.String dpzbbg){
		this.dpzbbg = dpzbbg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  归档卷宗号
	 */
	
	@Column(name ="GDJZH",nullable=true,length=200)
	public java.lang.String getGdjzh(){
		return this.gdjzh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  归档卷宗号
	 */
	public void setGdjzh(java.lang.String gdjzh){
		this.gdjzh = gdjzh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  其他信息附件
	 */
	
	@Column(name ="OTHERFILEATTACH",nullable=true,length=200)
	public java.lang.String getOtherfileattach(){
		return this.otherfileattach;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  其他信息附件
	 */
	public void setOtherfileattach(java.lang.String otherfileattach){
		this.otherfileattach = otherfileattach;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  抗闩锁方案
	 */
	
	@Column(name ="KSSFA",nullable=true,length=200)
	public java.lang.String getKssfa(){
		return this.kssfa;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  抗闩锁方案
	 */
	public void setKssfa(java.lang.String kssfa){
		this.kssfa = kssfa;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  总剂量方案
	 */
	
	@Column(name ="ZJLFA",nullable=true,length=200)
	public java.lang.String getZjlfa(){
		return this.zjlfa;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  总剂量方案
	 */
	public void setZjlfa(java.lang.String zjlfa){
		this.zjlfa = zjlfa;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单粒子方案
	 */
	
	@Column(name ="DLZFA",nullable=true,length=200)
	public java.lang.String getDlzfa(){
		return this.dlzfa;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单粒子方案
	 */
	public void setDlzfa(java.lang.String dlzfa){
		this.dlzfa = dlzfa;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  鉴定一致性自定义上传
	 */
	
	@Column(name ="JDYZZDY",nullable=true,length=200)
	public java.lang.String getJdyzzdy(){
		return this.jdyzzdy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  鉴定一致性自定义上传
	 */
	public void setJdyzzdy(java.lang.String jdyzzdy){
		this.jdyzzdy = jdyzzdy;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  PIND不合格数
	 */
	
	@Column(name ="PINDBHGS",nullable=true,length=32)
	public java.lang.String getPindbhgs(){
		return this.pindbhgs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  PIND不合格数
	 */
	public void setPindbhgs(java.lang.String pindbhgs){
		this.pindbhgs = pindbhgs;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  PIND分析报告
	 */
	
	@Column(name ="PINDFXBG",nullable=true,length=200)
	public java.lang.String getPindfxbg(){
		return this.pindfxbg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  PIND分析报告
	 */
	public void setPindfxbg(java.lang.String pindfxbg){
		this.pindfxbg = pindfxbg;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  投入测试数量
	 */
	
	@Column(name ="FZHTRCSSL",nullable=true,length=32)
	public java.lang.String getFzhtrcssl(){
		return this.fzhtrcssl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  投入测试数量
	 */
	public void setFzhtrcssl(java.lang.String fzhtrcssl){
		this.fzhtrcssl = fzhtrcssl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  测试合格数量
	 */
	
	@Column(name ="FZHCSHGSL",nullable=true,length=32)
	public java.lang.String getFzhcshgsl(){
		return this.fzhcshgsl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  测试合格数量
	 */
	public void setFzhcshgsl(java.lang.String fzhcshgsl){
		this.fzhcshgsl = fzhcshgsl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  封装后测试成品率
	 */
	
	@Column(name ="FZHCSCPL",nullable=true,length=32)
	public java.lang.String getFzhcscpl(){
		return this.fzhcscpl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  封装后测试成品率
	 */
	public void setFzhcscpl(java.lang.String fzhcscpl){
		this.fzhcscpl = fzhcscpl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  封装成品率
	 */
	
	@Column(name ="FZCPL",nullable=true,length=32)
	public java.lang.String getFzcpl(){
		return this.fzcpl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  封装成品率
	 */
	public void setFzcpl(java.lang.String fzcpl){
		this.fzcpl = fzcpl;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选报告号
	 */
	
	@Column(name ="SXBGH",nullable=true,length=200)
	public java.lang.String getSxbgh(){
		return this.sxbgh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选报告号
	 */
	public void setSxbgh(java.lang.String sxbgh){
		this.sxbgh = sxbgh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  鉴定一致性检验报告编号
	 */
	
	@Column(name ="JDYZXJYBGH",nullable=true,length=200)
	public java.lang.String getJdyzxjybgh(){
		return this.jdyzxjybgh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  鉴定一致性检验报告编号
	 */
	public void setJdyzxjybgh(java.lang.String jdyzxjybgh){
		this.jdyzxjybgh = jdyzxjybgh;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选开始时间
	 */
	
	@Column(name ="SXSTARTTIME",nullable=true,length=32)
	public java.lang.String getSxstarttime(){
		return this.sxstarttime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选开始时间
	 */
	public void setSxstarttime(java.lang.String sxstarttime){
		this.sxstarttime = sxstarttime;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  筛选结束时间
	 */
	
	@Column(name ="SXENDTIME",nullable=true,length=32)
	public java.lang.String getSxendtime(){
		return this.sxendtime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  筛选结束时间
	 */
	public void setSxendtime(java.lang.String sxendtime){
		this.sxendtime = sxendtime;
	}
	
}
