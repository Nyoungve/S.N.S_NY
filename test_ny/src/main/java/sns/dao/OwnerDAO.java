package sns.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sns.dto.OwnerDTO;

public class OwnerDAO extends SqlSessionDaoSupport{

	
	//owner 정보를 받아서 owner 테이블에 정보를 넣는 Dao
	public void insertShop(OwnerDTO ownerDto){
	getSqlSession().update("enterprise.insert",ownerDto);	
	}
	
}
