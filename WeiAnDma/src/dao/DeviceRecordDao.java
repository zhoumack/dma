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
public class DeviceRecordDao extends BaseClass{
	 private OraConn db=null;
	 public DeviceRecordDao() throws SQLException{
	   super(DeviceRecordDao.class.getName());
	   db=new OraConn();
	}
	
	public OraConn getDb() {
		     return db;
	 }
	public void setDb(OraConn db) {
		this.db = db;
	 }

	public List selectById(String id,String date)throws Exception{
		  String strsql=
				  "select *from"+ 
				  "( select rownum rn,a.* from "+
				       "(select * from DMA.DEVICERECORD where DEVICEID="+id+"and to_char(collecttime,'yyyy-mm-dd hh24:mi:ss.ff') like '%"+date+"%' order by collecttime"+
				        ")a"+ 
				  ") "; 					
		  SqlUtil sqlutil=new SqlUtil(db);
		  //sqlutil.setConnection("java:jboss//datasources//OracleDMA");
		  LinkedList  list=new  LinkedList ();
			 sqlutil.setSql(strsql);
			 try {
			        list =sqlutil.executeParamList();
			     } catch (Exception e) {
			        log.info("执行类MapData中getMapData方法错误！"+e.toString()+"  sql="+strsql);
			        throw new Exception(e.toString());
			     }
		return list;
		
	}
}
