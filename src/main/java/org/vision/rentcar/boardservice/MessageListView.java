package org.vision.rentcar.boardservice;

import java.util.List;

import org.vision.rentcar.model.RentBoard;


public class MessageListView {
		
		private int messageTotalCount; //총 자료수
		private int currentPageNumber; //현재페이지
		private List<RentBoard> messageList; // 모든자료
		private int messageCountPerPage; // 한 페이지에 나타낼 자료수
		private int firstRow; // 페이지에 나타낼 첫행
		private int endRow; // 페이지에 나타낼 마지막행
		
		
		private int pageTotalCount; // 총 페이지수,	모든자료를 페이지에 나타낼 자료수로 나눈값
		
		public MessageListView(int messageTotalCount, int currentPageNumber, List<RentBoard>messageList,int messageCountPerPage, int firstRow,int endRow) {
			super();
			this.messageTotalCount = messageTotalCount;
			this.currentPageNumber = currentPageNumber;
			this.messageList = messageList;
			this.messageCountPerPage = messageCountPerPage;
			this.firstRow = firstRow;
			this.endRow = endRow;
			calculatePageTotalCount();
			
		}
		
		private void calculatePageTotalCount() {
			if(messageTotalCount == 0) {
				pageTotalCount =0;
			}else {
				pageTotalCount = messageTotalCount / messageCountPerPage;
				if(messageTotalCount % messageCountPerPage>0 ) {
					pageTotalCount++;
				}
				
			}
		}
		public int gerMessageTotlaCount() {
			return messageTotalCount;
		}
		public int gerCurrentPageNumber() {
			return currentPageNumber;
		}
		public List<RentBoard>getMessageList(){
			return messageList;
		}
		public int getFirstRow() {
			return firstRow;
		}
		public int getEndRow() {
			return endRow;
		}
		public int getPageTotalCount() {
			return pageTotalCount;
		}
		public boolean isEmpty() {
			return messageTotalCount==0;
		}



	
}


