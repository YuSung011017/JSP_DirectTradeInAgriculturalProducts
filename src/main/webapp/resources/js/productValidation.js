function validateProductForm() {
    var p_id = document.getElementsByName("p_id")[0].value;
    var p_name = document.getElementsByName("p_name")[0].value;
    var p_price = document.getElementsByName("p_price")[0].value;
    var p_description = document.getElementsByName("p_description")[0].value;
    var p_startDate = document.getElementsByName("p_startDate")[0].value;
    var p_endDate = document.getElementsByName("p_endDate")[0].value;
    var p_stock = document.getElementsByName("p_stock")[0].value;
    var p_fileName = document.getElementsByName("p_fileName")[0].value;

    if (p_id.trim() === "" || p_name.trim() === "" || p_price.trim() === "" || 
        p_description.trim() === "" || p_startDate === "" || p_endDate === "" || 
        p_stock.trim() === "" || p_fileName === "") {
        alert("모든 필드를 입력해주세요.");
        return false;
    }

    if (!/^\d+$/.test(p_price)) {
        alert("가격은 숫자만 입력해주세요.");
        return false;
    }

    if (!/^\d+$/.test(p_stock)) {
        alert("재고수량은 숫자만 입력해주세요.");
        return false;
    }

    var startDate = new Date(p_startDate);
    var endDate = new Date(p_endDate);
    if (startDate >= endDate) {
        alert("유통기한은 재배일보다 늦어야 합니다.");
        return false;
    }

    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
    if (!allowedExtensions.exec(p_fileName)) {
        alert('이미지 파일만 업로드 가능합니다.');
        return false;
    }

    return true;
}