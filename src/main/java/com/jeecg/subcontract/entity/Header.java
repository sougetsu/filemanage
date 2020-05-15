package com.jeecg.subcontract.entity;

public class Header {
	private String field;
    private String title;
    private int width=150;

    public Header()
    {
    	
    }
    public Header(String field, String title, int width) {
        super();
        this.field = field;
        this.title = title;
        this.width = width;
    }
    public String getField() {
        return field;
    }
    public void setField(String field) {
        this.field = field;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public int getWidth() {
        return width;
    }
    public void setWidth(int width) {
        this.width = width;
    }
    @Override
    public String toString() {
        return "[field:" + field + ", title:" + title + ", width:"
                + width + "]";
    }
}
