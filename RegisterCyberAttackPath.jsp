  <%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
   <fieldset id="infoFieldset" style="display:none;">
    <div class="modal fade" id="attack_reg" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
           <h5 class="modal-title" id="modal">사이버 공격 경로</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
           </button>
        </div>

         
          <div class="modal-body">
            <form action="./regAction.jsp" method="post">
              
              <div class="form-row">
                <div class="form-group col-sm-6" style = "margin-bottom:13px">
                  <h4>1.운영적 보안조치</h4>
                  <h4></h4> 
                  <div class = "check_div" id = "checkdiv">
                  <c:forEach var = "data" items="${dao.getCyberAttack_content(1.1) }">
                  <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h4>1.1 인적보안</h4>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th style="background-color:#eeeeee; text-align:center;"></th>
                  <th  style="background-color:#eeeeee; text-align:center;">번호</th>                         
                 <th  style = "background-color : #eeeeee; text-align:center;">통제항목명</th>                 
                 </tr>
                 </thead>
                 
                 <tbody>              
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td><c:out value = "${dao.control_item_no }"/></td>
                 <td><c:out value = "${dao.control_item }"/></td>
                 </tr>
                 
                 <!--  
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.1.2</td>
                 <td>업무종료 혹은 이전</td>
                 </tr>
                 
                 -->
             </tbody>
             </table>
             </c:forEach>
             
             
             
             <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h4>1.2 시스템 및 정보의 무결성</h4>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th  style="background-color:#eeeeee; text-align:center;"></th>
                  <th  style="background-color:#eeeeee; text-align:center;">번호</th>                         
                 <th  style = "background-color : #eeeeee; text-align:center;">통제항목명</th>                 
                 </tr>
                 </thead>
                 
                 <tbody>              
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.1</td>
                 <td>결함 제거</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.2</td>
                 <td>악성코드 유입 방지</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.3</td>
                 <td>악성코드 유입 방지</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.4</td>
                 <td>보안 경고</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.5</td>
                 <td>보안기능 확인</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.6</td>
                 <td>소프트웨어 및 정보의 무결성</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.7</td>
                 <td>정보의 입력 제한</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.4</td>
                 <td>에러에 대한 조치</td>
                 </tr>
              </tbody>
               </table>    
                  </div>
                  
                  
                </div>
                
                <div class="form-group col-sm-6" style = "margin-bottom:13px">
                  <h4>2.관리적 보안 조치</h4>
                  <div class = "check_div" id = "checkdiv">
                  <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h4>2.1 시스템 및 서비스 획득</h4>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th style="background-color:#eeeeee; text-align:center;"></th>
                  <th  style="background-color:#eeeeee; text-align:center;">번호</th>                         
                 <th style = "background-color : #eeeeee; text-align:center;">통제항목명</th>                 
                 </tr>
                 </thead>
                 
                 <tbody>              
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.1</td>
                 <td>공급망 통제</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.2</td>
                 <td>신뢰성 확보</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.3</td>
                 <td>보안 설계 적용</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.4</td>
                 <td>개발자 보안 테스트</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.5</td>
                 <td>인수테스트</td>
                 </tr>
             </tbody>
             </table>
              </div>
              </div>
                      <button type="submit" class="btn btn-primary" data-target="#attack_reg">등록하기</button>


              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary" onclick="return test_checkbox()">등록하기</button>
              </div>

            </form>

          </div>

        </div>

      </div>

    </div>
                      
              </section>