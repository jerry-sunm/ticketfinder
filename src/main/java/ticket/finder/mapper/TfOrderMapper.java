package ticket.finder.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ticket.finder.dto.Dual;
import ticket.finder.dto.OrderDetailFcltyHallRefund;
import ticket.finder.dto.OrderDShow;
import ticket.finder.dto.OrderQShow;
import ticket.finder.dto.OrderRate;
import ticket.finder.dto.OrderRefund;
import ticket.finder.dto.TfOrder;

public interface TfOrderMapper {
	int insertOrder(TfOrder order);
	int updateOrder(TfOrder order);
	int updateStateRefund(String orderCode);
	int deleteUnpaidOrder(String orderCode);
	TfOrder selectOrder(String orderCode);
	TfOrder selectMyOrder(String userId);
	List<OrderRefund> selectUserOrderList(Map<String, String> map);
	List<TfOrder> selectDateOrder(String startDate, String endDate);
	List<TfOrder> selectRankOrder(Map<String, Object> map);
	List<TfOrder> selectOrderList();
	List<TfOrder> selectUnpaidOrderList();
	List<TfOrder> selectLongUnpaidOrderList();
	List<TfOrder> selectShOrderList();
	List<TfOrder> selectTicketingList();
	int updateDpState(String orderCode);
	int updateShState(String orderCode);
	int updateTicketing(String orderCode);
	int selectOrderCount(String userId);
	List<OrderQShow> selectOrderQshow(Map<String, String> map);
	List<OrderRate> selectRankGenre(Map<String, String> map);
	Dual selectOrderCountAdmin();
	List<Map<String, Object>> selectCountGenre(String param1);
	List<OrderDShow> selectTicketing(@Param("startDate") String startDate, @Param("endDate") String endDate);
	List<OrderDetailFcltyHallRefund> selectOrderFclty(@Param("startDate") String startDate, @Param("endDate") String endDate);
	OrderDetailFcltyHallRefund selectOrderFcltyChoice(String orderCode);
	List<OrderDetailFcltyHallRefund> selectRefundFclty(@Param("startDate") String startDate, @Param("endDate") String endDate);
	OrderDetailFcltyHallRefund selectRefundFcltyChoice(int refundNum);
	List<OrderDetailFcltyHallRefund> selectShowOrder(@Param("startDate") String startDate, @Param("endDate") String endDate);
	List<OrderDShow> selectShowOrderChoice(String showName);
	List<OrderDShow> selectShowSelectOne();
	List<OrderDShow> selectShowSelectTwo(String showCode);
	List<OrderDetailFcltyHallRefund> selectShowSeat(int showNum);
	List<OrderQShow> selectReviewOrderList(Map<String, String> map);
}
