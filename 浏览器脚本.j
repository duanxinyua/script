// 生成一个符合标准的随机字符串
function generateUsername(length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-';
    let result = '';

    // 需要至少 2 个 '-'
    let hyphenCount = 0;
    let hasLower = false;
    let hasUpper = false;
    let hasNumber = false;

    // 第一个字符不能是 '-'
    let firstChar;
    do {
        firstChar = characters.charAt(Math.floor(Math.random() * characters.length));
    } while (firstChar === '-');
    result += firstChar;

    // 确保中间部分有字符，并满足条件
    while (result.length < length - 1) {
        let char = characters.charAt(Math.floor(Math.random() * characters.length));
        result += char;

        if (char === '-') hyphenCount++;
        if (/[a-z]/.test(char)) hasLower = true;
        if (/[A-Z]/.test(char)) hasUpper = true;
        if (/[0-9]/.test(char)) hasNumber = true;
    }

    // 确保最后一个字符不是 '-'
    let lastChar;
    do {
        lastChar = characters.charAt(Math.floor(Math.random() * characters.length));
    } while (lastChar === '-');
    result += lastChar;

    // 确保满足至少有两个 '-'
    while (hyphenCount < 2 || !hasLower || !hasUpper || !hasNumber) {
        result = '';  // 重新生成字符串
        hyphenCount = 0;
        hasLower = false;
        hasUpper = false;
        hasNumber = false;

        // 第一部分保证非 '-' 开始
        do {
            firstChar = characters.charAt(Math.floor(Math.random() * characters.length));
        } while (firstChar === '-');
        result += firstChar;

        // 生成满足条件的中间部分
        while (result.length < length - 1) {
            let char = characters.charAt(Math.floor(Math.random() * characters.length));
            result += char;

            if (char === '-') hyphenCount++;
            if (/[a-z]/.test(char)) hasLower = true;
            if (/[A-Z]/.test(char)) hasUpper = true;
            if (/[0-9]/.test(char)) hasNumber = true;
        }

        // 最后一个字符不能是 '-'
        do {
            lastChar = characters.charAt(Math.floor(Math.random() * characters.length));
        } while (lastChar === '-');
        result += lastChar;
    }

    return result;
}

// 生成一个随机长度的合法用户名（长度 10 到 16）
function generateValidUsername() {
    const length = Math.floor(Math.random() * (16 - 10 + 1)) + 10; // 生成 10 到 16 的随机长度
    return generateUsername(length);
}

// 生成一个小写字母字符串
function generateLowercaseString(length) {
    const characters = 'abcdefghijklmnopqrstuvwxyz';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

// 获取输入框并赋值
function setRandomValues() {
    document.getElementById('id_username').value = generateValidUsername(); // 生成符合条件的用户名
    document.getElementById('id_first_name').value = generateLowercaseString(6); // 小写字母，6 位
    document.getElementById('id_last_name').value = generateLowercaseString(4); // 小写字母，4 位
    document.getElementById('id_email').value = "这里填写邮箱";
    document.getElementById('id_question').value = "0";
}

// 勾选复选框
document.getElementById('id_tos').checked = true;

// **立即执行一次以赋初值**
setRandomValues();

// 每 1 秒刷新前三个值
setInterval(function() {
    setRandomValues();
}, 1000);
