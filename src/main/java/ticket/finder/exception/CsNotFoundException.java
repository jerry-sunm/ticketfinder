package ticket.finder.exception;

// ���������� ���� ��� �߻��ϴ� ����Ŭ����
public class CsNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public CsNotFoundException() {	}
	
	public CsNotFoundException(String message) {
		super(message);
	}
	
}
