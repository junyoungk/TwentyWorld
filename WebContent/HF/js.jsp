<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
function passchk(){
	 var pass = document.form.user_pw.value;
	 var pass2 = document.form.user_pw2.value;
	 if (pass2.length == 0 || pass2 == null) {
	  document.form.chk.value = "비밀번호를 입력하세요";
	  right = 0;
	 } else if (pass != pass2) {
	  document.form.chk.value = "비밀번호가 다릅니다.";
	  right = 0;
	 } else {   
	  document.form.chk.value = "비밀번호가 동일합니다.";
	  right = 1;
	 }
	 return;
	}
	
function idcheck(){
	 var id = document.form.user_id.value;
	 if(id.length<1 || id==null){
	  alert("중복체크할 아이디를 입력하십시오");
	  return false;
	 }
	 var url = "idCheck.jsp?id=" + id;
	 window.open(url, "get", "height = 180, width = 300");
	
	}
</script>
 <script>
      function openNav() {
        document.getElementById("myNav").style.width = "60%";
      }
      
      function closeNav() {
        document.getElementById("myNav").style.width = "0%";
      }
      </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </div>
</body>
</html>