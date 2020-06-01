package ticket.finder.dao;

import java.util.List;

import ticket.finder.dto.Fclty;
import ticket.finder.dto.FcltyHall;
import ticket.finder.dto.FcltyX;

public interface FcltyXDAO {
	FcltyHall selectHall(String hallCode);
	Fclty selectFclty(String fcCode);
	List<FcltyX> selectFcltyXList();
	List<Fclty> selectFcltyList();
}
