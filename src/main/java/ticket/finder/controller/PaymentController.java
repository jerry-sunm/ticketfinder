package ticket.finder.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.finder.dto.ShowXShow;
import ticket.finder.dto.TfOrder;
import ticket.finder.dto.TfUser;
import ticket.finder.exception.SameOrderCodeException;
import ticket.finder.exception.ShowNumNotFoundException;
import ticket.finder.service.ShowDetailService;
import ticket.finder.service.ShowXShowService;
import ticket.finder.service.TfOrderService;
import ticket.finder.util.Tf_utility;

@Controller
public class PaymentController {
	@Autowired
	private ShowXShowService showXShowService;
	
	@Autowired
	private ShowDetailService showDetailService;
	
	@Autowired
	private TfOrderService tfOrderService;
	
	@RequestMapping(value = "/seat.do/{showNum}", method = RequestMethod.GET)
	public String seat(@PathVariable String showNum, Model model) throws NumberFormatException, ShowNumNotFoundException {
		ShowXShow showInfo=showXShowService.getShowDetail(Integer.parseInt(showNum));
		model.addAttribute("showInfo", showInfo);
		return "/user/pay/seat";
	}
	
	@RequestMapping(value = "/seatJson.do/{showNum}", method = RequestMethod.GET)
	@ResponseBody
	public List<String[]> seatJson(@PathVariable String showNum, Model model) throws NumberFormatException, ShowNumNotFoundException {
		ShowXShow showInfo=showXShowService.getShowDetail(Integer.parseInt(showNum));
		String seats=showInfo.getShowDetail().getShowSeat();
		Tf_utility uti = new Tf_utility();
		//uti.seatsTable(seats);
		
		/*
		String[] seatArray=seats.replace("\\n", "\n").split("\n");
		
		int sizeX = seatArray[0].length();
		int sizeY = seatArray.length;
		
		List<String[]> list=new ArrayList<String[]>();
		
		for(int i=0; i<sizeY; i++){
			String[] line = new String[sizeX];
			for(int j=0; j<sizeX; j++) {
				line[j]=seatArray[i].substring(j, j+1);
			}
			list.add(line);
		}
		*/
		return uti.seatsTable(seats);
	}
	
	@RequestMapping(value = "/delivery.do/{showNum}", method = RequestMethod.POST)
	public String delivery(@PathVariable String showNum, @RequestParam List<String> seatName, @RequestParam List<String> seatNum, Model model) throws NumberFormatException, ShowNumNotFoundException {
		ShowXShow showInfo=showXShowService.getShowDetail(Integer.parseInt(showNum));
		model.addAttribute("showInfo", showInfo);
		model.addAttribute("seatName", seatName);	
		model.addAttribute("showNum", seatNum);	
		
		System.out.println(seatNum.size());
		return "/user/pay/delivery";
	}
	
	@RequestMapping(value = "/pay.do/{showNum}", method = RequestMethod.POST)
	public String pay(@PathVariable String showNum, @RequestParam List<String> seatName, @RequestParam List<String> seatNum, Model model, HttpSession session) 
			throws Exception {
		//�������� ��ȯ�޾� ����
		ShowXShow showInfo=showXShowService.getShowDetail(Integer.parseInt(showNum));
		
		//�¼������� ��ȯ�޾� ����
		String seatinfo="";
		for(int i=0; i<seatName.size(); i++) {
			if(i>0) {
				seatinfo+=", ";
			}
			seatinfo+=seatName.get(i);
		}
		
		//����� ������ ��ȯ�޾� ���� �� �ֹ� ���̺� �߰�
		TfUser loginUserInfo=(TfUser)session.getAttribute("loginUserInfo");
		
		Tf_utility uti = new Tf_utility();
		
		TfOrder order=new TfOrder();
		order.setOrderCode(uti.makeOrderCode());
		order.setOrderPrice(showInfo.getTfShow().getsPrice() * seatName.size());
		order.setOrderShowNum(showInfo.getShowDetail().getShowNum());
		order.setOrderSeat(seatinfo);
		order.setOrderGrade("R��");
		order.setOrderFees(1000);
		order.setOrderShipfees(2500);
		order.setOrderReceipt("���");
		order.setOrderUserId(loginUserInfo.getUserId());
		order.setOrderUserName(loginUserInfo.getUserName());
		order.setOrderPayment("�ſ�ī��");
		order.setOrderQty(seatName.size());
		order.setOrderDpState("�Ա�");
		order.setOrderShState("�̹߼�");
		order.setOrderTicketing("�̹߱�");
		
		tfOrderService.addOrder(order);
		
		model.addAttribute("orderCode", order.getOrderCode());
		
		//������ȣ�� ���޹��� ���� �¼������� �����Ͽ� �ٲ� �¼� ���� ��ȯ
		String newSeat=uti.modifySeatTable(uti.seatsTable(showInfo.getShowDetail().getShowSeat()), seatNum, "2");
		
		//����� �¼� ���� ����
		showInfo.getShowDetail().setShowSeat(newSeat);
		
		//������ ����Ͽ� ����
		showInfo.getShowDetail().setShowRate(uti.bookedRate(showInfo.getShowDetail().getShowSeat()));

		//������ �¼� ���� �� ������ ����
		showDetailService.modifyShowDetail(showInfo.getShowDetail());
		
		return "/user/pay/pay";
	}
	/*
	@RequestMapping(value = "/pay.do", method = RequestMethod.GET)
	public String pay() throws NumberFormatException, ShowNumNotFoundException {
		return "/user/pay/pay";
	}
	
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery() throws NumberFormatException, ShowNumNotFoundException {
		return "/user/pay/delivery";
	}
	*/
}
