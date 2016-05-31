package com.dma.dmg;

//public class deviceData {
//
//}
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.mobile.GlobalFunction;
import com.mobile.db.DbConn;

import dao.DeviceDao;
import dao.DeviceRecordDao;
import dao.Pixel_deviceDao;

public class deviceData {
private DeviceDao device;
private Pixel_deviceDao pixel_device;
private DeviceRecordDao device_record;


	public deviceData() throws Exception{
		device =new DeviceDao();
		device_record=new DeviceRecordDao();
		pixel_device=new Pixel_deviceDao();
	}
	public deviceData(DeviceDao device, Pixel_deviceDao pixel_device) {
		this.device = device;
		this.pixel_device = pixel_device;
	}


	public Map getInstrumentData(HashMap parameter)throws Exception{
		String pixelId=(String)parameter.get("pixelId");
		Map pd_ass=pixel_device.selectByPixelId(pixelId);
		List devList=device.selectById(pd_ass.get("device_id").toString());
		Map map=new HashMap();
		map.put("devList", devList.get(0));
		return map;
	}
	
	public String getDeviceRecord(HashMap parameter) throws Exception{
		Map map=new HashMap();
		String deviceid=(String)parameter.get("deviceid");
		String date=(String)parameter.get("date");
		LinkedList devRecordList=(LinkedList) device_record.selectById(deviceid,date);
		return GlobalFunction.ListToJson(devRecordList);
	}
}
