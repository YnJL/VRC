function openfilter(){
	if(document.getElementById('filtertable').style.display == 'none'){
		document.getElementById('filtertable').style.display = 'block';
		filter.value = '옵션닫기';
		
	} else{
		document.getElementById('filtertable').style.display = 'none';
		filter.value = '검색옵션';
	}
}