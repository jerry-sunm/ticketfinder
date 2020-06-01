package ticket.finder.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Tf_utility {
	//공연좌석테이블을 전달받아 예매율을 계산하여 반환하는 메소드
	public float bookedRate(String seats) {
		int totalSeat=0;
		int bookedSeat=0;
		
		for(int i=0; i<seats.length(); i++){
			if(seats.substring(i, i+1).equals("2")){
				bookedSeat++;
			}
			
			if(seats.substring(i, i+1).equals("1") || seats.substring(i, i+1).equals("2")) {
				totalSeat++;
			}
		}
		return (float)bookedSeat/totalSeat;
	}
	
	//공연좌석테이블을 전달받아 JSON화 하기 위한 배열을 만드는 메소드
	public List<String[]> seatsTable(String seats){
		//String[] seatArray=seats.split("\n");
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
		return list;
	}
	
	//좌석테이블, 예약좌석, 변경상태를 전달받아 변경된 좌석테이블을 반환하는 메소드
	public String modifySeatTable(List<String[]> oldSeatTable, List<String> bookSeatList, String state) throws Exception {
		//매개변수 state에 1, 2 이외의 값이 있을 경우 예외발생
		if(!state.equals("1") && !state.equals("2")) {
			throw new Exception();
		}
		
		for(String seatNum:bookSeatList) {
			String[] seatNumArray=seatNum.split("-");
			int y=Integer.parseInt(seatNumArray[0]);
			int x=Integer.parseInt(seatNumArray[1]);
			
			String[] line=oldSeatTable.get(y);
			line[x]=state;
		}
			
		String newSeat="";
		for(String[] row:oldSeatTable) {
			for(String r:row) {
				newSeat+=r;
			}
			newSeat+="\n";
		}
			
		return newSeat;
	}
	
	//예매좌석("X열 XX석" 형식)을 전달받아 좌석번호("X-XX" 형식)로 변환하는 메소드
	public List<String> changeSeatNameToNum(String seats) {
		String[] seatArray=seats.split(",");
		
		String seatY="ABCDEFGHIJKLMNOPQRSTUVXYZ";
		
		List<String> seatList=new ArrayList<String>();
		
		for(String seat:seatArray) {
			int y=seatY.indexOf(seat.trim().substring(0, 1));
			//String x=seat.substring(seat.length()-3, seat.length()-1).trim();
			int x=Integer.parseInt(seat.substring(seat.length()-3, seat.length()-1).trim())-1;
			seatList.add(y+"-"+x);
		}
		
		return seatList;
	}
	
	
	//주문 코드 생성 메소드
	public String makeOrderCode() {
		Date today = new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMddHHmmss");
		String newPw = sdf.format(today).substring(2);
		
		String endChar="";
		for (int i=0; i<4; i++) {
			endChar+=(char)((int)(Math.random()*26)+65);
		}
		
		return newPw+endChar;
	}
}






