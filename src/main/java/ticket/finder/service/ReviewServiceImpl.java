package ticket.finder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.ReviewDAO;
import ticket.finder.dto.Review;
import ticket.finder.dto.ReviewSd;
import ticket.finder.dto.ReviewShowInfo;
import ticket.finder.exception.ReviewNotFoundExcpetion;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void addReview(Review review) {
		reviewDAO.insertReview(review);
	}

	@Override
	public void modifyStateReview(int reviewNum) throws ReviewNotFoundExcpetion {
		if(reviewDAO.selectReview(reviewNum)==null) {
			throw new ReviewNotFoundExcpetion("존재하지 않는 리뷰입니다.");
		}
		reviewDAO.updateStateReview(reviewNum);
	}

	@Override
	public Review getReview(int reviewNum) throws ReviewNotFoundExcpetion {
		if(reviewDAO.selectReview(reviewNum)==null) {
			throw new ReviewNotFoundExcpetion("존재하지 않는 리뷰입니다.");
		}
		return reviewDAO.selectReview(reviewNum);
	}

	@Override
	public List<Review> getIdReview(String reviewUserId) {
		return reviewDAO.selectIdReview(reviewUserId);
	}

	@Override
	public List<Review> getReviewList() {
		return reviewDAO.selectReviewList();
	}

	@Override
	public int getReviewCount(String reviewUserId) {
		return reviewDAO.selectReviewCount(reviewUserId);
	}

	@Override
	public List<ReviewShowInfo> getUserReviewList(Map<String, String> map) {
		return reviewDAO.selectUserReviewList(map);
	}

	@Override
	public List<Review> getShowReviewList(int reviewShowCode) {
		return reviewDAO.selectShowReviewList(reviewShowCode);
	}

	@Override
	public List<ReviewSd> getReviewSdList() {
		return reviewDAO.selectReviewSdList();
	}

	@Override
	public List<ReviewShowInfo> getShowDetailReviewList(String showCode) {
		return reviewDAO.selectShowDetailReviewList(showCode);
	}

}
