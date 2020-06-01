package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.Review;
import ticket.finder.dto.ReviewSd;
import ticket.finder.dto.ReviewShowInfo;
import ticket.finder.mapper.ReviewMapper;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReview(Review review) {
		return sqlSession.getMapper(ReviewMapper.class).insertReview(review);
	}

	@Override
	public int updateStateReview(int reviewNum) {
		return sqlSession.getMapper(ReviewMapper.class).updateStateReview(reviewNum);
	}

	@Override
	public Review selectReview(int reviewNum) {
		return sqlSession.getMapper(ReviewMapper.class).selectReview(reviewNum);
	}

	@Override
	public List<Review> selectIdReview(String reviewUserId) {
		return sqlSession.getMapper(ReviewMapper.class).selectIdReview(reviewUserId);
	}

	@Override
	public List<Review> selectReviewList() {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewList();
	}

	@Override
	public int selectReviewCount(String reviewUserId) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewCount(reviewUserId);
	}

	@Override
	public List<ReviewShowInfo> selectUserReviewList(Map<String, String> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectUserReviewList(map);
	}

	@Override
	public List<Review> selectShowReviewList(int reviewShowCode) {
		return sqlSession.getMapper(ReviewMapper.class).selectShowReviewList(reviewShowCode);
	}

	@Override
	public List<ReviewSd> selectReviewSdList() {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewSdList();
	}

	@Override
	public List<ReviewShowInfo> selectShowDetailReviewList(String showCode) {
		return sqlSession.getMapper(ReviewMapper.class).selectShowDetailReviewList(showCode);
	}
}
