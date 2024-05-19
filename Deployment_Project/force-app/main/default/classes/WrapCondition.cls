public with sharing class WrapCondition {
	public String fieldApiName;
    public String operator;
    public Object value;
    public String dataType;
    public WrapCondition(String fieldApiName, String operator, Object Value, String dataType){
        this.fieldApiName = fieldApiName;
        this.operator = operator;
        this.value = value;
        this.dataType = dataType;
    }
}