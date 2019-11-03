package eva;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Point {
	   
	   
	   public static void main(String[] args) {
	      
	      List<SelectedControlItem> itemList = Create_itemList();
	      List<SelectedControlItem> datas = Create_datas();
	      
	      TotalArr[] arr= new TotalArr[datas.size()];
	      
	       String str="";
	      
	       // itemList와 datas 정렬
	      Collections.sort(datas, new sort());
	      Collections.sort(itemList, new sort());
	      
	      // 출력
	      System.out.println("**itemList**");
	      for(int i=0;i<itemList.size();i++) {
	         System.out.println(itemList.get(i));
	      }
	      
	      System.out.println("**datas**");   
	      for(int i=0;i<datas.size();i++) {
	         System.out.println(datas.get(i));
	      }
	      System.out.println("\n");
	            
	      int j = -1;
	      
	      // datas List 안 각각의 항목에 대한 상중하 값 합계 구하기
	      for(int i = 0;i<datas.size(); i++) {
	         String id = datas.get(i).getControl_item_no();
	         String importance=datas.get(i).getImportance();
	         
	         if(!id.equals(str)) {
	            arr[++j]= new TotalArr(id);         
	            str = id;            
	            TotalArr.setSize(j + 1);
	      
	         }

	         if(importance.equals("상")) {
	            arr[j].add(3);            
	         }
	         else if(importance.equals("중")) {
	            arr[j].add(2);
	         }
	         else if(importance.equals("하")) {
	            arr[j].add(1);
	         }
	         else {
	            arr[j].add(0);
	         }
	         
	      }
	      
	      // 출력
	      // TotalArr
	      for(int i = 0;i < TotalArr.getSize(); i++) {
	         System.out .println("ID: " + arr[i].getId() + "  SUM: " + arr[i].getSum());
	         
	      }
	      
	      j = 0 ;
	      
	      //itemList에 result가 "N" 인 항목에만  FinalPriority 변수에 상중하 합계값을 넣습니다
	      for(int i = 0;i < TotalArr.getSize(); i++) {
	         if(arr[i].getId().equals(itemList.get(j).getId())) {
	            while(j < itemList.size() && arr[i].getId().equals(itemList.get(j).getId())){
	               if(itemList.get(j).getResult().equals("N")) {
	                  itemList.get(j).setFinalPriority(arr[i].getSum());
	               }      
	               j++;
	            }
	         }
	         else {
	            while(j < itemList.size() && !arr[i].getId().equals(itemList.get(j).getId())){               
	               j++;
	            }
	            i--;
	         }      
	      }
	      
	      // 출력
	      // 최종 itemList
	      System.out.println("");
	      for(int i = 0; i<itemList.size();i++) {
	         System.out.println(itemList.get(i));
	      }
	   }
	   
	   
	   // DB와 비슷한 환경을 만들기위한 초기화 과정
	   private static List<SelectedControlItem> Create_datas() {
	      // TODO Auto-generated method stub
	      List<SelectedControlItem> temp = new ArrayList<SelectedControlItem>();
	 
	      // public SelectedControlItem(String id, String importance, String result, int finalPriority)
	       SelectedControlItem item = new SelectedControlItem();
	       item.setControl_item_no("D.1.1");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	  
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.1.2");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	 
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.1.4");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);

	       item = new SelectedControlItem();
	       item.setControl_item_no("E.10.2");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	       


	       item = new SelectedControlItem();
	       item.setControl_item_no("D.2.8");
	       item.setImportance("중");
	       item.setResult("N");
	       temp.add(item);
	 
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.1.4");
	       item.setImportance("하");
	       item.setResult("N");
	       temp.add(item);
	       

	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.4.2");
	       item.setImportance("중");
	       item.setResult("N");
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.4.2");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	       
	       return temp;
	   }
	   
	   // DB와 비슷한 환경을 만들기위한 초기화 과정
	   private static List<SelectedControlItem> Create_itemList() {
	      // TODO Auto-generated method stub
	      List<SelectedControlItem> temp = new ArrayList<SelectedControlItem>();
	  
	       SelectedControlItem item = new SelectedControlItem();
	       item.setControl_item_no("D.1.1");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.1.1");
	       item.setImportance("상");
	       item.setResult("Y");
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.5.7");
	       item.setImportance("하");   
	       item.setResult("Y");
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.4.8");
	       item.setImportance("하");
	       item.setResult("Y");
	       temp.add(item);
	 
	 
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.1.2");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	 
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.1.4");
	       item.setResult("N");
	       item.setImportance("상");      
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.1.4");
	       item.setResult("N");
	       item.setImportance("상");      
	       temp.add(item);
	 
	 
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.10.2");
	       item.setResult("N");
	       item.setImportance("상");    
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.1.3");
	       item.setImportance("중");
	       item.setResult("Y");
	       temp.add(item);
	       
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.10.2");
	       item.setImportance("상");
	       item.setResult("Y");
	       temp.add(item);
	 
	 
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.1.8");
	       item.setImportance("중");
	       item.setResult("Y");
	       temp.add(item);
	 
	 
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.2.8");
	       item.setImportance("중");
	       item.setResult("N");
	       temp.add(item);
	    
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.4.2");
	       item.setResult("N");
	       item.setImportance("중");      
	       temp.add(item);
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("D.4.2");
	       item.setImportance("상");
	       item.setResult("N");
	       temp.add(item);
	       
	       
	       item = new SelectedControlItem();
	       item.setControl_item_no("E.5.9");
	       item.setImportance("하");
	       item.setResult("Y");
	       temp.add(item);
	       
	       
	       return temp;
	   }
	   
	   // 내림차순 정렬
	   static class sort implements Comparator<SelectedControlItem> {
	      @Override
	      public int compare(SelectedControlItem arg0, SelectedControlItem arg1) {
	         // TODO Auto-generated method stub
	         return arg0.getControl_item_no().compareTo(arg1.getControl_item_no());
	      }
	}
}

