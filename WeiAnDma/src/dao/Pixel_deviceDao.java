package dao;


import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.mobile.BaseClass;
import com.mobile.GlobalFunction;
import com.mobile.GlobalNames;
import com.mobile.db.DbConn;
import com.mobile.util.SqlUtil;

public class Pixel_deviceDao extends BaseClass{

	 private DbConn db=null;
	 public Pixel_deviceDao(){
	   super(Pixel_deviceDao.class.getName());
	   db=new DbConn();
	}
	 public Pixel_deviceDao(DbConn db){
	   super(Pixel_deviceDao.class.getName());
	   this.db = db;
	}
	public DbConn getDb() {
		     return db;
	 }
	public void setDb(DbConn db) {
		this.db = db;
	 }

	public Map selectByPixelId(String pixelId)throws Exception{
		  String strsql="select * from pixel_device where  pixel_id=?";
		  SqlUtil sqlutil=new SqlUtil();
//		  sqlutil.setConnection("java:jboss//datasources//OracleDMA");
		  String params="";
		  LinkedList  list=new  LinkedList ();
			 sqlutil.setSql(strsql);
			 params=pixelId;
			 try {
			        list =sqlutil.executeParamList(params);
			     } catch (Exception e) {
			        log.info("执行类MapData中getMapData方法错误！"+e.toString()+"  sql="+strsql);
			        throw new Exception(e.toString());
			     }
		return (Map)list.get(0);
		
	}
}
