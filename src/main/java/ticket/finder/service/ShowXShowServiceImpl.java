package ticket.finder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.ShowXShowDAO;
import ticket.finder.dto.ShowDetail;
import ticket.finder.dto.ShowXShow;
import ticket.finder.exception.ShowNumNotFoundException;

@Service
public class ShowXShowServiceImpl implements ShowXShowService {
	@Autowired
	private ShowXShowDAO showXShowDAO;
	
	public ShowXShowServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<ShowXShow> getSearch(Map<String, String> map) {
		return showXShowDAO.selectSearch(map);
	}

	@Override
	public ShowXShow getShowDetail(int showNum) throws ShowNumNotFoundException {
		ShowXShow show = showXShowDAO.selectShowDetail(showNum);
		if(show==null) {
			throw new ShowNumNotFoundException("입력하신 공연번호에 맞는 공연이 없습니다.");
		}
		return show;
	}
	
	@Override
	public List<ShowXShow> getShowDetailByCode(String showCode) {
		return showXShowDAO.selectShowDetailByCode(showCode);
	}

	@Override
	public List<ShowXShow> getShowHot() {
		return showXShowDAO.selectShowHot();
	}
	
	@Override
	public List<ShowXShow> getHotGenre(Map<String, String> map) {
		return showXShowDAO.selectHotGenre(map);
	}

	@Override
	public List<ShowXShow> getRank(Map<String, String> map) {
		return showXShowDAO.selectRank(map);
	}

	@Override
	public List<ShowXShow> getAreaNew(Map<String, String> map) {
		return showXShowDAO.selectAreaNew(map);
	}

	@Override
	public List<ShowXShow> getAreaEnd(Map<String, String> map) {
		return showXShowDAO.selectAreaEnd(map);
	}

	@Override
	public List<ShowXShow> getAreaName(Map<String, String> map) {
		return showXShowDAO.selectAreaName(map);
	}

	@Override
	public List<ShowXShow> getFcltyShow(String fcCode) {
		return showXShowDAO.selectFcltyShow(fcCode);
	}

	@Override
	public List<ShowXShow> getSelectShowList() {
		return showXShowDAO.selectShowList();
	}

	@Override
	public List<ShowXShow> getSelectConcerList() {
		return showXShowDAO.selectConcerList();
	}

	@Override
	public List<ShowXShow> getSelectMusicalList() {
		return showXShowDAO.selectMusicalList();
	}

	@Override
	public List<ShowXShow> getSelectPlayList() {
		return showXShowDAO.selectPlayList();
	}

	@Override
	public List<ShowXShow> getSelectClassicList() {
		return showXShowDAO.selectClassicList();
	}

	@Override
	public List<ShowXShow> getSelectEndShowList() {
		return showXShowDAO.selectEndShowList();
	}

	@Override
	public List<ShowXShow> gettGenreList(String sGenre) {
		return showXShowDAO.selectGenreList(sGenre);
	}

	@Override
	public List<ShowXShow> getGenreYear(String sGenre) {
		return showXShowDAO.selectGenreYear(sGenre);
	}

	@Override
	public List<ShowXShow> getDaytimeList(String sCode, String showArea) {
		return showXShowDAO.selectDaytimeList(sCode, showArea);
	}

	@Override
	public List<ShowXShow> getGenreNew(String sGenre) {
		return showXShowDAO.selectGenreNew(sGenre);
	}

	@Override
	public List<ShowXShow> getRandomArea(String sGenre) {
		return showXShowDAO.selectRandomArea(sGenre);
	}

	@Override
	public ShowXShow getShowName(String showName) {
		return showXShowDAO.selectShowName(showName);
	}
}
