package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.TfUser;
import ticket.finder.mapper.TfUserMapper;

@Repository
public class TfUserDAOImpl implements TfUserDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertUser(TfUser user) {
		return sqlSession.getMapper(TfUserMapper.class).insertUser(user);
	}

	@Override
	public int updateUser(TfUser user) {
		return sqlSession.getMapper(TfUserMapper.class).updateUser(user);
	}

	@Override
	public int dormantUser(String id) {
		return sqlSession.getMapper(TfUserMapper.class).dormantUser(id);
	}
	
	@Override
	public int updateLastDate(String userId) {
		return sqlSession.getMapper(TfUserMapper.class).updateLastDate(userId);
	}

	@Override
	public String selectFindIdUser(Map<String, String> map) {
		return sqlSession.getMapper(TfUserMapper.class).selectFindIdUser(map);
	}

	@Override
	public TfUser selectUser(String userId) {
		return sqlSession.getMapper(TfUserMapper.class).selectUser(userId);
	}

	@Override
	public List<TfUser> selectUserList() {
		return sqlSession.getMapper(TfUserMapper.class).selectUserList();
	}

	@Override
	public List<TfUser> dormantUserList() {
		return sqlSession.getMapper(TfUserMapper.class).dormantUserList();
	}

	@Override
	public List<TfUser> dormantedUserList() {
		return sqlSession.getMapper(TfUserMapper.class).dormantedUserList();
	}

	@Override
	public int selectIdCheck(String userId) {
		return sqlSession.getMapper(TfUserMapper.class).selectIdCheck(userId);
	}

}
