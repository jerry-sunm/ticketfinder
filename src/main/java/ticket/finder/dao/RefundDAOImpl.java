package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.OrderRefundShowDetail;
import ticket.finder.dto.Refund;
import ticket.finder.mapper.RefundMapper;

@Repository
public class RefundDAOImpl implements RefundDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertRefund(Refund refund) {
		return sqlSession.getMapper(RefundMapper.class).insertRefund(refund);
	}

	@Override
	public int updateRefundState(String refundState, int refundNum) {
		return sqlSession.getMapper(RefundMapper.class).updateRefundState(refundState, refundNum);
	}

	@Override
	public int deleteRefund(int refundNum) {
		return sqlSession.getMapper(RefundMapper.class).deleteRefund(refundNum);
	}

	@Override
	public Refund selectRefundByNum(int refundNum) {
		return sqlSession.getMapper(RefundMapper.class).selectRefundByNum(refundNum);
	}
	
	@Override
	public Refund selectRefundByOrder(String orderCode) {
		return sqlSession.getMapper(RefundMapper.class).selectRefundByOrder(orderCode);
	}

	@Override
	public List<Refund> selectRefundByDate(String startDate, String endDate) {
		return sqlSession.getMapper(RefundMapper.class).selectRefundByDate(startDate, endDate);
	}

	@Override
	public List<Refund> selectRefundByKeyword(Map<String, Object> map) {
		return sqlSession.getMapper(RefundMapper.class).selectRefundByKeyword(map);
	}

	@Override
	public List<Refund> selectUserRefund(Map<String, Object> map) {
		return sqlSession.getMapper(RefundMapper.class).selectUserRefund(map);
	}

	@Override
	public List<OrderRefundShowDetail> selectRefundList() {
		return sqlSession.getMapper(RefundMapper.class).selectRefundList();
	}

	@Override
	public List<OrderRefundShowDetail> selectCancelOrderList() {
		return sqlSession.getMapper(RefundMapper.class).selectCancelOrderList();
	}

	@Override
	public int updateRefundStateSuccess(String refundOrderCode) {
		return sqlSession.getMapper(RefundMapper.class).updateRefundStateSuccess(refundOrderCode);
	}

}
