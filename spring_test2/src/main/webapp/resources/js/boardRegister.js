console.log("in");

document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
})

//실행파일, 이미지파일, 파일 최대 사이즈 정규 표현식 작성
const regExp = new RegExp("\.(exe|sh|bat|dll|jar|msi)$");
const maxSize = 1024*1024*20; //파일 최대 크기 설정

function fileValidation(fileName, fileSize){
    if(regExp.test(fileName)){
        return 0;
    }else if(fileSize > maxSize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    console.log(e.target);
    if(e.target.id == 'files'){ //파일에 변화가 생겼다면
        //intpur file element에 저장된 file의 정보를 가져오는 property
        const fileObject = document.getElementById('files').files;
        console.log(fileObject);

        //한번 disabled 되면 혼자 풀어질 수 없음 버튼을 원래 상태로 복구
        document.getElementById('regBtn').disabled=false;

        //첨부파일에 대한 정보를 fileZone에 기록
        let div = document.getElementById('fileZone');
        div.innerHTML='';
       // ul>li로 값을 추가
       // <ul class="list-group">
       // <li class="list-group-item disabled" aria-disabled="true">A disabled item</li>

       // 여러 파일에 대한 검증을 모두 통과하기 위해서 * 로 각 파일마다 통과 여부를 확인
       let isOk =1;
       let ul = `<ul class="list-group">`;
        for(let file of fileObject){
            //개별 파일의 검증 결과
            let validResult = fileValidation(file.name, file.size);
            isOk *= validResult;
            ul +=`<li class="list-group-item">`;
            ul +=`<div class="mb-3">`;
            ul += `${validResult ? '<div class="fw-bold"> 업로드 가능 </div> ': '<div class="fw-bold text-danger">업로드 불가능</div>'}`;
            ul += `${file.name}</div>`;
            ul += `<span class="badge text-bg-${validResult ? 'success' : 'danger'}">${file.size}Byte</span>`;
            ul +=`</li>`;
        }
       ul += `</ul>`
       div.innerHTML = ul;

       if(isOk == 0){
     
        document.getElementById('regBtn').disabled=true;
       }
    }
})
   //하나의 파일이라도 검증에 통과하지 못한다면 버튼 비활화