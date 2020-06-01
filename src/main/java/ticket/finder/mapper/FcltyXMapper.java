package ticket.finder.mapper;

import java.util.List;

import ticket.finder.dto.Fclty;
import ticket.finder.dto.FcltyHall;
import ticket.finder.dto.FcltyX;

public interface FcltyXMapper {
	FcltyHall selectHall(String hallCode);
	Fclty selectFclty(String fcCode);
	List<FcltyX> selectFcltyXList();
	List<Fclty> selectFcltyList();
}
