package ticket.finder.dto;

public class Refund {
	private int refundNum;
	private String refundOrderCode;
	private String refundDate;
	private int refundPenalty;
	private int refundPay;
	private String refundState;
	private String refundUserId;
	
	
	public Refund() {
		// TODO Auto-generated constructor stub
	}

	public int getRefundNum() {
		return refundNum;
	}

	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}

	public String getRefundOrderCode() {
		return refundOrderCode;
	}

	public void setRefundOrderCode(String refundOrderCode) {
		this.refundOrderCode = refundOrderCode;
	}

	public String getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}

	public int getRefundPenalty() {
		return refundPenalty;
	}

	public void setRefundPenalty(int refundPenalty) {
		this.refundPenalty = refundPenalty;
	}

	public int getRefundPay() {
		return refundPay;
	}

	public void setRefundPay(int refundPay) {
		this.refundPay = refundPay;
	}

	public String getRefundState() {
		return refundState;
	}

	public void setRefundState(String refundState) {
		this.refundState = refundState;
	}

	public String getRefundUserId() {
		return refundUserId;
	}

	public void setRefundUserId(String refundUserId) {
		this.refundUserId = refundUserId;
	}
	
	
}
