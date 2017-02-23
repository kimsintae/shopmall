package com.kst.shopmall.util;

public class PaginateUtil {
	
	
	
	
	public static String getPaginate(int pageNo,
			                         int total,
			                         int numPage,
			                         int numBlock,
			                         String url) {

		//total : 전체 게시물수
				//numPage : 한 페이지에 보여지는
				//           게시물수
				//numBlock : 한 페이지에 보여지는
				//           블록수
				//now : 현재 페이지
				//url : 링크(phonebook.jsp?page=)
				
				System.out.println("페이징유틸 단 : "+url);
				
				//전체페이지 갯수
				int totalPage = (int)Math.ceil((double)total/numPage);
				
				
				//현재블록 계산은
				// now/numBlock 올림
				int nowBlock = 
						(int)Math.ceil((double)pageNo/numBlock);
				
				
				//StringBuilder 를 이용
				
				StringBuilder paginate = 
				new StringBuilder("<div class='paginate'>");
				
				//제일먼저 이전버튼
				if(pageNo==1) {
					//이전버튼 비활성화
					paginate.append("<span class=\"prev\" title=\"이전 페이지 없음\"><i class=\"fa fa-chevron-left\"></i><span class=\"screen_out\">이전</span></span>");
				}else {
					//이전버튼 활성화
					paginate.append("<a class=\"prev\" href=\""+url+(pageNo-1)+"\" title=\"이전 페이지로\"><i class=\"fa fa-chevron-left\"></i><span class=\"screen_out\">이전</span></a>");
				}
				
				//1페이지라도 있으면
				if(totalPage>0) {
					
					
					for(int i = 0 ; i < numBlock ; i++ ) {
						
						//페이징에 출력될 프린트 숫자계산
						int printNum = 
								(nowBlock*numBlock)-(numBlock-1)+i;
						
						//현재 페이지냐? 아니냐?
						if(pageNo==printNum) {
							
							//현재페이지
							paginate.append("<span class=\"now\" title=\"현재 "+pageNo+"페이지\">"+pageNo+"</span>");
						}else {
							paginate.append("<a href=\""+url+printNum+"\" title=\""+printNum+"\">"+printNum+"</a>");
						}
						
						if(printNum>=totalPage) {
							break;
						}
					}
				}
				
				//제일 마지막 이후버튼
				if(pageNo>=totalPage) {
					//비활성화
					paginate.append("<span class=\"next\" title=\"다음페이지 없음\"><i class=\"fa fa-chevron-right\"></i><span class=\"screen_out\">다음</span></span>");
				}else {
					//활성화
					paginate.append("<a class=\"next\" href=\""+url+(pageNo+1)+"\" title=\"다음 페이지로\"><i class=\"fa fa-chevron-right\"></i><span class=\"screen_out\">다음</span></a>");
				}
				
				paginate.append("</div>");
				
				
			
				return paginate.toString();
	}	

	
	//남/여/아동 페이징유틸
	public static String getOneTypePaginate(int pageNo,
					            int total,
					            int numPage,
					            int numBlock,
					            String url,
					            String orderBy) {
					
					System.out.println("페이지유틸 : "+pageNo);
					System.out.println("페이지유틸 : "+total);
					System.out.println("페이지유틸 : "+numPage);
					System.out.println("페이지유틸 : "+numBlock);
					System.out.println("페이지유틸 : "+url);
					//total : 전체 게시물수
					//numPage : 한 페이지에 보여지는
					//           게시물수
					//numBlock : 한 페이지에 보여지는
					//           블록수
					//now : 현재 페이지
					//url : 링크(phonebook.jsp?page=)
					
					//System.out.println("페이징유틸 단 : "+url);
					
					System.out.println("페이징유틸 내 orderBy : "+orderBy);
					
					//전체페이지 갯수
					int totalPage = (int)Math.ceil((double)total/numPage);
					
					
					//현재블록 계산은
					// now/numBlock 올림
					int nowBlock = 
					(int)Math.ceil((double)pageNo/numBlock);
					
					
					//StringBuilder 를 이용
					
					StringBuilder paginate = 
					new StringBuilder("<div class='paginate'>");
					
					//제일먼저 이전버튼
					if(pageNo==1) {
					//이전버튼 비활성화
					paginate.append("<span class=\"prev\" title=\"이전 페이지 없음\"><i class=\"fa fa-chevron-left\"></i><span class=\"screen_out\">이전</span></span>");
					}else {
					//이전버튼 활성화
					paginate.append("<a class=\"prev\" href=\""+url+(pageNo-1)+"&orderBy="+orderBy+"\" title=\"이전 페이지로\"><i class=\"fa fa-chevron-left\"></i><span class=\"screen_out\">이전</span></a>");
					}
					
					//1페이지라도 있으면
					if(totalPage>0) {
					
					
					for(int i = 0 ; i < numBlock ; i++ ) {
					
					//페이징에 출력될 프린트 숫자계산
					int printNum = 
							(nowBlock*numBlock)-(numBlock-1)+i;
					
					//현재 페이지냐? 아니냐?
					if(pageNo==printNum) {
						
						//현재페이지
						paginate.append("<span class=\"nowPage\" title=\"현재 "+pageNo+"페이지\">"+pageNo+"</span>");
					}else {
						paginate.append("<a href=\""+url+printNum+"&orderBy="+orderBy+"\" title=\""+printNum+"\">"+printNum+"</a>");
					}
					
					if(printNum>=totalPage) {
						break;
					}
					}
					}
					
					//제일 마지막 이후버튼
					if(pageNo>=totalPage) {
					//비활성화
					paginate.append("<span class=\"next\" title=\"다음페이지 없음\"><i class=\"fa fa-chevron-right\"></i><span class=\"screen_out\">다음</span></span>");
					}else {
					//활성화
					paginate.append("<a class=\"next\" href=\""+url+(pageNo+1)+"&orderBy="+orderBy+"\" title=\"다음 페이지로\"><i class=\"fa fa-chevron-right\"></i><span class=\"screen_out\">다음</span></a>");
					}
					
					paginate.append("</div>");
					
					
					
					return paginate.toString();
					}	


}
