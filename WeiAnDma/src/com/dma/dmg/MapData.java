package com.dma.dmg;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.mobile.BaseClass;
import com.mobile.GlobalFunction;
import com.mobile.db.DbConn;
import com.mobile.util.SqlUtil;

public class MapData extends BaseClass{

	 private DbConn db=null;
	 public MapData(){
	   super(MapData.class.getName());
	   db=new DbConn();
	}
	 public MapData(DbConn db){
	   super(MapData.class.getName());
	   this.db = db;
	}
	public DbConn getDb() {
		     return db;
	 }
	public void setDb(DbConn db) {
		this.db = db;
	 }

	public String getMapData(HashMap parameter)throws Exception{
		 String strsql="";
		 String params="";
		 LinkedList  list=new  LinkedList ();
		 SqlUtil sqlutil=new SqlUtil();
		 String CHART_ID=(String)parameter.get("CHART_ID");
		  strsql="select * from dmg_pixel where  CHART_ID=?";
		 sqlutil.setSql(strsql);
		 params=CHART_ID;
		 try {
		        list =sqlutil.executeParamList(params);
		     } catch (Exception e) {
		        log.info("执行类MapData中getMapData方法错误！"+e.toString()+"  sql="+strsql);
		        throw new Exception(e.toString());
		     }
		   String json=GlobalFunction.ListToJson(list);
			return json;
		
	}
}
