package org.jeecgframework.core.common.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 外协加工流水号
 * @author onlineGenerator
 * @date 2019-04-13 20:47:26
 * @version V1.0   
 *
 */
@Entity
@Table(name = "wxjg_lsh", schema = "")
@SuppressWarnings("serial")
public class WxjgLshEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.Integer id;
	/**年份*/
	@Excel(name="年份",width=15)
	private java.lang.String yearid;
	/**流水号*/
	@Excel(name="流水号",width=15)
	private java.lang.String lsh;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	@Column(name ="ID",nullable=false,length=20)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  主键
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  年份
	 */

	@Column(name ="YEARID",nullable=false,length=32)
	public java.lang.String getYearid(){
		return this.yearid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  年份
	 */
	public void setYearid(java.lang.String yearid){
		this.yearid = yearid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  流水号
	 */

	@Column(name ="LSH",nullable=false,length=32)
	public java.lang.String getLsh(){
		return this.lsh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  流水号
	 */
	public void setLsh(java.lang.String lsh){
		this.lsh = lsh;
	}
}