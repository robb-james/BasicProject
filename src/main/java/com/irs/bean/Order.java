package com.irs.bean;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import lombok.Getter;
import lombok.Setter;

/**
 * 订单
 * 
 * @author robb
 *
 */
@TableName("tb_order")

public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String oid;
	private Integer uid;
	private Integer did;
	private Date otime;
	private Double ototal;
	private Integer ostate;
	private Integer paytype;
	private Integer oboard;
	@TableField(exist = false)
	private String gname;
	@TableField(exist = false)
	private String gimage;
	@TableField(exist = false)
	private Integer num;
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public Date getOtime() {
		return otime;
	}
	public void setOtime(Date otime) {
		this.otime = otime;
	}
	public Double getOtotal() {
		return ototal;
	}
	public void setOtotal(Double ototal) {
		this.ototal = ototal;
	}
	public Integer getOstate() {
		return ostate;
	}
	public void setOstate(Integer ostate) {
		this.ostate = ostate;
	}
	public Integer getPaytype() {
		return paytype;
	}
	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}
	public Integer getOboard() {
		return oboard;
	}
	public void setOboard(Integer oboard) {
		this.oboard = oboard;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}

	
}