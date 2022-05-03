function qq(pm){
	const qty = document.getElementById('qty');
	
	let num = qty.value;
	
	if(pm === 'plus') {
		num = parseInt(num) + 1;
	} else if(pm === 'minus') {
		num = parseInt(num) - 1;
		if(num < 0) num = 0;
	}
	
	qty.value = num;
	
}

function dd(pm){
	const dday = document.getElementById('dday');
	
	let num = dday.value;
	
	if(pm === 'plus') {
		num = parseInt(num) + 1;
	} else if(pm === 'minus') {
		num = parseInt(num) - 1;
		if(num < 0) num = 0;
	}
	
	dday.value = num;
	
}