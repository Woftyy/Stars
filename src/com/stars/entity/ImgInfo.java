/**
 * 
 */
package com.stars.entity;

/**
 * @author Administrator
 *
 */
public class ImgInfo {

	 private Integer id;
	 
	    private String imgurl;
	 
	    private String remark;
	 
	    private Integer state;
	 
	    public Integer getId() {
	        return id;
	    }
	 
	    public void setId(Integer id) {
	        this.id = id;
	    }
	 
	    public String getImgurl() {
	        return imgurl;
	    }
	 
	    public void setImgurl(String imgurl) {
	        this.imgurl = imgurl == null ? null : imgurl.trim();
	    }
	 
	    public String getRemark() {
	        return remark;
	    }
	 
	    public void setRemark(String remark) {
	        this.remark = remark == null ? null : remark.trim();
	    }
	 
	    public Integer getState() {
	        return state;
	    }
	 
	    public void setState(Integer state) {
	        this.state = state;
	    }

}
