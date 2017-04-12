package sns.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.web.multipart.MultipartFile;

import sns.dto.FileInfoDTO;
import sns.dto.ReserveDTO;
import sns.dto.RestaurantDTO;
import sns.dto.ZipcodeDTO;


public class RestaurantDAO extends SqlSessionDaoSupport{

	
	public RestaurantDTO  selectWorkingClosingTime(String restaurant_number){
		
		RestaurantDTO restaurantDto = getSqlSession().selectOne("restaurant.selectWorkingClosingTime", restaurant_number);
		return restaurantDto;
		
	}
	
	
	public void reserveOk(ReserveDTO reserveDTO) {
		getSqlSession().update("reserve.e_reserveOk", reserveDTO);
		
	}
	
	public void reserveCancel(ReserveDTO reserveDTO) {
		getSqlSession().update("reserve.e_reserveCancel", reserveDTO);
		
	}
	
	
	public String getE_info(String userid) {
		System.out.println(userid);
		String e_num = getSqlSession().selectOne("enterInfo.getE_Number", userid);
		return e_num;
	}
	
	
	public void insertEnterInfo(RestaurantDTO enterInfo) {
		getSqlSession().insert("enterInfo.insertE_Info", enterInfo);
	}
	
	public void upload(MultipartFile image, String e_name) {
		
		
		long now = System.currentTimeMillis();
		Random r = new Random();
		int i = r.nextInt(50);
		String name = e_name + "_" + now + "_" + i;
		String ori_name = image.getOriginalFilename();
		File new_file = new File("f://E_image//" + name + "_" + ori_name);
		
		try {
			image.transferTo(new_file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileInfoDTO f = new FileInfoDTO(image.getOriginalFilename(), new_file.getPath(), image.getSize());
		getSqlSession().insert("file.addFile", f);
	}

	
	
}
