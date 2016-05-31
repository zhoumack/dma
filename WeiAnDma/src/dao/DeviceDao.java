package dao;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import jndi.OraConn;

import org.apache.commons.collections.map.HashedMap;

import com.mobile.BaseClass;
import com.mobile.GlobalFunction;
import com.mobile.db.DbConn;
import com.mobile.util.SqlUtil;

public class DeviceDao extends BaseClass{

	 private OraConn db=null;
	 public DeviceDao() throws SQLException{
	   super(DeviceDao.class.getName());
	   db=new OraConn();
	}
	 public DeviceDao(OraConn db){
	   super(DeviceDao.class.getName());
	   this.db = db;
	}
	public OraConn getDb() {
		     return db;
	 }
	public void setDb(OraConn db) {
		this.db = db;
	 }

	public List selectById(String id)throws Exception{
		  String strsql="select * from DMA.Device where  Deviceid=?";
		  SqlUtil sqlutil=new SqlUtil(db);
		  //sqlutil.setConnection("java:jboss//datasources//OracleDMA");
		  String params="";
		  LinkedList  list=new  LinkedList ();
			 sqlutil.setSql(strsql);
			 params=id;
			 try {
			        list =sqlutil.executeParamList(params);
			     } catch (Exception e) {
			        log.info("执行类MapData中getMapData方法错误！"+e.toString()+"  sql="+strsql);
			        throw new Exception(e.toString());
			     }
		return list;
		
	}
}
