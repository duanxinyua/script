// 获取公网 IP 地址
fetch('https://api.ipify.org?format=json')
    .then(response => response.json())
    .then(data => {
        const ip = data.ip;
        console.log('你的公网 IP 地址:', ip);

        // 使用百度 API 查询 IP 信息
        const baiduApiUrl = `https://qifu.baidu.com/ip/geo/v1/district?ip=${ip}`;
        return fetch(baiduApiUrl);
    })
    .then(response => response.json())
    .then(data => {
        if (data.code === "Success") {
            const { owner, isp, country } = data.data;
            console.log('IP 信息:');
            console.log('归属地:', country);
            console.log('运营商:', isp);
            console.log('拥有者:', owner);
        } else {
            console.error('百度接口返回错误:', data);
        }
    })
    .catch(error => {
        console.error('请求失败:', error);
    });
