package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.Faq;
import ticket.finder.dto.FaqPage;
import ticket.finder.mapper.FaqMapper;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertFaq(Faq faq) {
		return sqlSession.getMapper(FaqMapper.class).insertFaq(faq);
	}

	@Override
	public int updateFaq(Faq faq) {
		return sqlSession.getMapper(FaqMapper.class).updateFaq(faq);
	}

	@Override
	public int deleteFaq(int faqNum) {
		return sqlSession.getMapper(FaqMapper.class).deleteFaq(faqNum);
	}

	@Override
	public Faq selectFaq(int faqNum) {
		return sqlSession.getMapper(FaqMapper.class).selectFaq(faqNum);
	}

	@Override
	public List<Faq> selectCategoryFaq(String faqCategory) {
		return sqlSession.getMapper(FaqMapper.class).selectCategoryFaq(faqCategory);
	}

	@Override
	public List<Faq> selectKeywordFaq(String faq) {
		return sqlSession.getMapper(FaqMapper.class).selectKeywordFaq(faq);
	}

	@Override
	public List<Faq> selectFaqList() {
		return sqlSession.getMapper(FaqMapper.class).selectFaqList();
	}

	@Override
	public List<Faq> selectCountFaq() {
		return sqlSession.getMapper(FaqMapper.class).selectCountFaq();
	}

	@Override
	public List<Faq> selectCategoryFaqOne() {
		return sqlSession.getMapper(FaqMapper.class).selectCategoryFaqOne();
	}

	@Override
	public List<Faq> selectCategoryFaqTwo() {
		return sqlSession.getMapper(FaqMapper.class).selectCategoryFaqTwo();
	}

	@Override
	public List<Faq> selectCategoryFaqThree() {
		return sqlSession.getMapper(FaqMapper.class).selectCategoryFaqThree();
	}

	@Override
	public List<FaqPage> selectFaqBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(FaqMapper.class).selectFaqBoardList(map);
	}

}
