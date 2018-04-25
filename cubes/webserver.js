var http = require('http');
var url = require('url');
var fs = require('fs');

http.createServer(function(req, res) {
  try {
    if (req.url.length > 1) {
      fs.readFile(req.url.replace(/\//, ''), function(err, data) {
        if (err) {
          console.log(err);
        } else {
          //console.log(req.url.split(/\./)[req.url.split(/\./).length - 1]);
          switch (req.url.split(/\./)[req.url.split(/\./).length - 1]) {
            case 'css':
              res.writeHead(200, {
                'Content-Type': 'text/css'
              });
              console.log('css');
              break;
            case 'js':
              res.writeHead(200, {
                'Content-Type': 'text/html'
              });
              console.log('js');
              break;
            case 'jpg':
              res.writeHead(200, {
                'Content-Type': 'image/jpeg'
              });
              console.log('jpg');
              break;
            case 'ico':
              res.writeHead(200, {
                'Content-Type': 'image/x-icon'
              });
              console.log('ico');
              break;
            case 'html':
              res.writeHead(200, {
                'Content-Type': 'text/html'
              });
              console.log('html');
              break;
            default:
              res.writeHead(200, {
                'Content-Type': 'text/plain'
              });
              break;
          }
          res.write(data);
          res.end();
        }
      });
    } else {
      fs.readFile('index.html', function(err, data) {
        if (err) throw err;
        res.writeHead(200, {
          'Content-Type': 'text/html'
        });
        console.log('html');
        if (data) res.write(data);
        res.end();
      });
    }
  } catch (err) {
    console.log(err);
  }
}).listen(80);
