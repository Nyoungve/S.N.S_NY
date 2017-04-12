package sns.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sns.dto.ReviewDTO;

public class ReviewDAO extends SqlSessionDaoSupport{

	
	
		//고객 후기 정보 확인을 위해 review 테이블에서 알려주는 Dao
		public List<ReviewDTO> getReviewList(String userid) {
			List<ReviewDTO> reviewDTO = getSqlSession().selectList("review.getReview", userid);
			return reviewDTO;
		}
		
		//고객 후기 지우는 review 테이블에서 알려주는 Dao
		public void deleteReview(ReviewDTO reviewDto) {
			getSqlSession().delete("review.deleteReview", reviewDto);
		}
	
}
