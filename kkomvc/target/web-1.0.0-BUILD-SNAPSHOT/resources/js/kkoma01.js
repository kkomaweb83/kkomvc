/**
 * 꼬마web 전용 자바스크립트
 */

/**
 * chk메소드
 * 인자값 : (정규식, 검증대상 객체, 검증 실패시 보여 줄 메시지)
 * 검증대상 객체는 반드시 input type = text 만 넣어주세요! 
 */
function chkWan(regex, obj, msg){
	if(regex.test(obj.val())) return true;
	else{
		alert(msg);
		obj.val("");
		obj.focus();
		obj.select();
		return false;
	}
}

//input 금액 "," 콤마 찍기
function insertComma(obj){
    var str = $( obj ).val();
    var reg = /(^[+-]?\d+)(\d{3})/;
    if( parseInt( str ) < 1 ) {
        str = 0;
    }
    while( reg.test( str ) ) {
        str = str.replace(reg, '$1' + ',' + '$2');
    } 
    $( obj ).val( str );
}
function insertCommaVal(val){
    var str = val + "";
    var reg = /(^[+-]?\d+)(\d{3})/;
    while( reg.test( str ) ) {
        str = str.replace(reg, '$1' + ',' + '$2');
    } 
    return str;
}
function insertCommaAll(){
    $( "input.changeAmount" ).each( function() {
        var str = $( this ).val();
        var reg = /(^[+-]?\d+)(\d{3})/;

        if( parseInt( str ) < 1 ) {
            str = str;
        }else{
            while( reg.test( str ) ) {
                str = str.replace(reg, '$1' + ',' + '$2');
            }
        } 
        $( this ).val( str );
    });
}

//input 금액 "," 제거
function removeComma(obj){
    if($( obj ).val().length > 0){
        $( obj ).val( parseInt($( obj ).val().replace( /,/g, "" ),10) );
    }
}
function removeCommaVal(val){
    if(val.length > 0){
        return parseInt(val.replace( /,/g, "" ),10);
    }else{
        return "0";
    }
}
function removeCommaAll(){
    /* 금액 "," 제거 */
    $( "input.changeAmount" ).each( function() {
        $( this ).val( $( this ).val().replace( /,/g, "" ) );
    });
}

//숫자가 아닐 경우 0 으로 처리
function isNumberNull(num){
    var i;
    if(num == null || num == undefined || num == "" || num.length <= 0)
        return 0;

    for(i=0;i<num.length;i++) {
        if((num.charAt(i) < '0' || num.charAt(i) > '9') && num.charAt(i) !='.'  )
        return 0;
    }

    return num;
}

//숫자만 입력 제한
function onOnlyNumber(obj){
    if(!window.event && !e) return;

    var keyCode = window.event ? window.event.keyCode : e.which;
    if( (48<=keyCode && keyCode <=57) ||               //숫자열 0 ~ 9 : 48 ~ 57
    		( 96 <= keyCode && 105 >= keyCode ) ||     //키패드 0 ~ 9 : 96 ~ 105
    		keyCode == 8 ||                                        //BackSpace
    		keyCode == 46 ||                                       //Delete
    		keyCode == 37 ||                                       //좌 화살표
    		keyCode == 39 ||                                       //우 화살표
    		keyCode == 35 ||                                       //End 키
    		keyCode == 36 ||                                       //Home 키
    		keyCode == 9 ||                                         //Tab 키
    		keyCode == 17 ||                                        //Ctrl 키
    		keyCode == 86 ||                                        //v 키
    		keyCode == 110 ||                                        //. 소수점
    		keyCode == 67                                            //c 키
            ){
    	if(keyCode == 48 || keyCode == 96) { //0을 눌렀을경우
    		if (obj.value == "0"){        //아무것도 없거나 현재 값이 0일 경우에서 0을 눌렀을경우
    			if(window.event) window.event.returnValue = false;
    	        else e.preventDefault();
    		}
    	}
        return;
    }else{
        if(window.event) window.event.returnValue = false;
        else e.preventDefault();
    }
}

//날짜점검
function dateCheck(no){
    var form = document.search;
    var startDateObj = form["srch_date_from"+no];
    var endDateObj = form["srch_date_to"+no];
    var startDate = startDateObj.value.replace( /\-/g,'' );
    var endDate = endDateObj.value.replace( /\-/g,'' );
    
    if(startDate.length != 8 || endDate.length != 8){
        alert("날짜가 정상적으로 입력 되지 않았습니다.");
        startDateObj.focus();
        return false;
    }

    if(startDate.length == 8) startDate = startDate.substring(0,4) + "/" + startDate.substring(4,6) + "/" +  startDate.substring(6,8);
    if(endDate.length == 8) endDate = endDate.substring(0,4) + "/" + endDate.substring(4,6) + "/" +  endDate.substring(6,8);
    var t_day = new Date(startDate);
    var f_day = new Date(endDate);
    var days = Math.floor( (f_day-t_day) / 1000 / 60 / 60 / 24 );
    if(days < 0){
        alert("조회 시작일자가 조회 끝일자보다 큽니다. \n날짜를 다시 입력해 주세요.");
        startDateObj.focus();
        return false;
    }else if(days > 365){
        alert("입력한 기간 : " + days + "\n조회 최대기간은 365일 입니다.\n날짜를 다시 입력해 주세요.");
        endDateObj.focus();
        return false;
    }else if(days != 0 && !days){
        alert("날짜가 정상적으로 입력 되지 않았습니다.");
        startDateObj.focus();
        return false;
    }

    return true;
}