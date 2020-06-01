package ticket.finder.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.ShowDetailDAO;
import ticket.finder.dto.ShowDetail;

@Service
public class ShowDetailServiceImpl implements ShowDetailService {
	@Autowired
	private ShowDetailDAO showDetailDAO;
	
	@Override
	public void addShowDetail(ShowDetail showDetail) {
		showDetailDAO.insertShowDetail(showDetail);
	}

	@Override
	public void modifyShowDetail(ShowDetail showDetail) {
		showDetailDAO.updateShowDetail(showDetail);
	}

	@Override
	public void modifyStateShowDetail(@Param("date") String date) {
		showDetailDAO.updateStateShowDetail(date);
	}

}
