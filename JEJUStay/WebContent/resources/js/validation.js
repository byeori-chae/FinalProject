function CheckAddStay() {
	
	var stay_code = document.getElementById("stay_code");
	var stay_name = document.getElementById("stay_name");
	var stay_price = document.getElementById("stay_price");
	var stay_max = document.getElementById("stay_max");
	
	//상품코드 체크
	if(! check(/^[A-D|0-9]{4,11}$/, stay_code, "▶상품코드◀\n알파벳과 숫자를 조합하여 4~12자 코드를 생성해주세요.\n첫 글자 [ A:호텔 B:리조트 C:펜션 D:카라반 ]"))
		return false;
	
	//상품명 체크
	if(stay_name.value.length < 4 || stay_name.value.length > 50) {
		alert("▶상품명◀\n최소 4자는 입력해주세요.");
		name.select();
		name.focus();
		return false;
	}
	
	//가격 체크
	if(stay_price.value.length == 0 || isNaN(stay_price.value)) {
		alert("▶가격◀\n숫자만 입력하세요.");
		stay_price.select();
		stay_price.focus();
		return false;
	}
	
	if(stay_price.value < 0) {
		alert("▶가격◀\n음수는 입력할 수 없습니다.");
		stay_price.select();
		stay_price.focus();
		return false;
	}
	
	//최대 인원 수 체크
	if(isNaN(stay_max.value)) {
		alert("▶최대 인원 수◀\n숫자만 입력하세요.");
		stay_max.select();
		stay_max.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newStay.submit()
}
