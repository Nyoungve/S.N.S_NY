package sns.dao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sns.dto.ReserveDTO;

public class ReserveDAO extends SqlSessionDaoSupport{

	
	//고객의 예약 정보를 reserve 테이블에 저장하는 Dao
	public void insertReserveData(ReserveDTO reserveDto){
	
		getSqlSession().insert("reserve.insertReserveData",reserveDto);	
	}
	
	
	//레스토랑 시간별 예약 현황을 reserve 테이블에서 알려주는 Dao
	public LinkedHashMap<Integer,Integer> searchAvailableTeamCount(String restaurant_number,String today,String openingTime,String closingTime){
		
		Map<String, String> map = new HashMap<>();
		map.put("restaurant_number", restaurant_number);
		map.put("today", today);
		map.put("openingTime", openingTime);
		map.put("closingTime", closingTime);
		
		
		LinkedHashMap<Integer,Integer> resultMap = getSqlSession().selectOne("reserve.searchAvailableTeamCount", map);
			
		System.out.println("resultMap.size():::"+resultMap.size());
	
		System.out.println("resultMap.22:::"+resultMap.get("11"));
		
		return resultMap;
	}
	
	
	//고객 예약 정보 확인을 위해 reserve테이블에서 알려주는 Dao
	public List<ReserveDTO> c_getReserveList(String userid, String end_rno) {
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("end_rno", end_rno);
		
		List<ReserveDTO> reserveDTO = getSqlSession().selectList("reserve.c_getReserve", map);
		return reserveDTO;
	}
	
	
	
	//업주가 예약 정보를 확인을 이해 reserve테이블에서 알려주는 Dao
	public List<ReserveDTO> e_getReserveList(String restaurant_number, String end_rno) {
		
		Map<String, String> map = new HashMap<>();
		map.put("restaurant_number", restaurant_number);
		map.put("end_rno", end_rno);
		
		List<ReserveDTO> reserveDTO = getSqlSession().selectList("reserve.e_getReserve", map);
		return reserveDTO;
		
	}
	
}
