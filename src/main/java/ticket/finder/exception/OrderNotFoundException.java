package ticket.finder.exception;

//주문 정보가 없을 경우 발생되는 예외 클래스 
public class OrderNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public OrderNotFoundException() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderNotFoundException(String message) {
		super(message);
	}
}
