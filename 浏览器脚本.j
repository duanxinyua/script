// 生成一个 8 位的小写随机字符串
function generateRandomString(length) {
    const characters = 'abcdefghijklmnopqrstuvwxyz';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

// 获取输入框并赋值
document.getElementById('id_username').value = generateRandomString(10);
document.getElementById('id_first_name').value = generateRandomString(6);
document.getElementById('id_last_name').value = generateRandomString(4);
document.getElementById('id_email').value = "s15meiguo@hetao.ink";
document.getElementById('id_question').value = "0";

// 勾选复选框
document.getElementById('id_tos').checked = true;

// 获取图片 src，并拼接请求 URL
const captchaImg = document.querySelector('img.captcha'); // 获取 captcha 图片
if (captchaImg && captchaImg.src) {
    const captchaSrc = captchaImg.src;

    // 替换图片 URL 的域名部分
    const imageUrl = captchaSrc.replace('https://webproxy.lumiproxy.com', 'https://www.serv00.com');

    // 创建 GET 请求的 URL 查询字符串
    const url = `https://自己验证码识别地址/?image=${encodeURIComponent(imageUrl)}`;

    // 打印请求的 URL
    console.log("请求的 URL:", url);

    // 发起 GET 请求
    fetch(url, {
        method: 'GET',
        headers: {
            'Accept': '*/*',
            'User-Agent': 'Mozilla/5.0',
            'Connection': 'keep-alive'
        }
    })
    .then(response => response.text()) // 获取响应的文本
    .then(text => {
        console.log('响应文本:', text); // 打印响应内容

        // 提取响应中的验证码部分
        const match = text.match(/验证码是:\s*([a-zA-Z]{4})/);
        
        if (match && match[1]) {
            const captcha = match[1]; // 提取到的验证码

            // 填入验证码到输入框
            document.getElementById('id_captcha_1').value = captcha;
        } else {
            // 如果没有找到符合的验证码格式，输出错误信息
            console.error('验证码格式错误:', text);
        }
    })
    .catch(error => {
        console.error('请求失败', error); // 捕获请求错误
    });
}
