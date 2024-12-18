// 生成一个符合标准的随机字符串
function generateUsername(length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-';
    let result = '';

    // 确保第一个字符不是 '-'
    let firstChar;
    do {
        firstChar = characters.charAt(Math.floor(Math.random() * characters.length));
    } while (firstChar === '-');
    result += firstChar;

    // 生成中间部分的字符
    for (let i = 1; i < length - 1; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }

    // 确保最后一个字符不是 '-'
    let lastChar;
    do {
        lastChar = characters.charAt(Math.floor(Math.random() * characters.length));
    } while (lastChar === '-');
    result += lastChar;

    return result;
}
// 生成一个随机长度的合法用户名
function generateValidUsername() {
    const length = Math.floor(Math.random() * (16 - 10 + 1)) + 10; // 生成 10 到 16 的随机长度
    return generateUsername(length);
}


// 获取输入框并赋值
function setRandomValues() {
    document.getElementById('id_username').value = generateValidUsername();
    document.getElementById('id_first_name').value = generateUsername(6); // 6 位随机字符串
    document.getElementById('id_last_name').value = generateUsername(4); // 4 位随机字符串
    document.getElementById('id_email').value = "s15deguo@hetao.ink";
    document.getElementById('id_question').value = "0";
}

// 勾选复选框
document.getElementById('id_tos').checked = true;

// **立即执行一次以赋初值**
setRandomValues();

// 每 5 秒刷新前三个值
setInterval(function() {
    setRandomValues();
}, 1000); 
