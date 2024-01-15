document.getElementById('logoutlink').addEventListener('click',(e)=>{
    e.preventDefault();  //원래 있는 이벤트들을 다 없애워 href 무효화
    document.getElementById('logoutForm').submit();
})