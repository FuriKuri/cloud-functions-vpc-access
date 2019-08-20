const http = require('http');

exports.callNginx = (req, res) => {
    http.get('http://' + process.env.NGINX_HOST, (resp) => {
        let data = '';

        resp.on('data', (chunk) => {
            data += chunk;
        });

        resp.on('end', () => {
            console.log(data);
            res.status(200).send(data);
        });

    }).on("error", (err) => {
        console.log("Error: " + err.message);
    });
}