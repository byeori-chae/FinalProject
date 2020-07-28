<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
/*
Fetch the buttom element
*/
const button = document.body.querySelector('[data-target="#collapseExample"]');
/*
Add click event listener where we will provide logic that updates the button text
*/
button.addEventListener('click', function() {
  
  /*
  Update the text of the button to toggle beween "More" and "Less" when clicked
  */
  if(button.innerText.toLowerCase() === 'less') {
    button.innerText = 'More';
  }
  else {
    button.innerText = 'Less';
  }
});
</script>
<title>Insert title here</title>
</head>
<body>

 
<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
More
</button>
<div class="collapse" id="collapseExample">
   <p>Test</p>
</div>
</body>
</html>