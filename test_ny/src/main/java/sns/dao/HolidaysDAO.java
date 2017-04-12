package sns.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import sns.dto.HolidayDTO;

public class HolidaysDAO extends SqlSessionDaoSupport{

	//홀리데이 넣기
	public void insertHoliday(String dateText, String restaurant_number){
		
		Map<String, String> map = new HashedMap();
		
		map.put("dateText", dateText);
		map.put("restaurant_number", restaurant_number);
		
		getSqlSession().insert("holidays.insert",map);
		
		
	}
	
	//홀리데이 가져오기
	public List<HolidayDTO> selectListHoliday(String restaurant_number){
		
		List<HolidayDTO> holidays =  getSqlSession().selectList("holidays.selectList", restaurant_number);
		
		return holidays;
	}
	
	public int compareholiday(String dateText, String restaurant_number){
		int resultNum =-1;
		Map<String, String> map = new HashedMap();
		
		map.put("dateText", dateText);
		map.put("restaurant_number", restaurant_number);
		
		resultNum = getSqlSession().selectOne("holidays.compareholiday", map);
		
		
		return resultNum;
	}
	
	public void deleteHoliday(String dateText, String restaurant_number){

		Map<String, String> map = new HashedMap();
		
		map.put("dateText", dateText);
		map.put("restaurant_number", restaurant_number);
		
		getSqlSession().insert("holidays.delete",map);
	}
	
	
}
