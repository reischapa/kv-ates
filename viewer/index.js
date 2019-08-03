const http = require('http');
const express = require('express');
const morgan = require('morgan');
const path = require('path');
const fs = require('fs');
const marked = require('marked');
const reload = require('reload');

const app = express();

app.use(morgan('dev'));

const getReadmeContents = () => {
  const rawString = fs.readFileSync(path.join(__dirname, '../', 'README.md'), 'utf-8');
  return marked(rawString.toString());
};

const getResponse = () => {
  return `
    <html>
      <head>
        <meta charset="UTF-8"/>
        <script src='reload/reload.js'></script>
        <link rel="stylesheet" type="text/css" href="res/index.css"></link>
      </head>
      <div id="content">${getReadmeContents()}</div>
    </html>
  `;
};

app.use('/res', express.static('res'));

app.get('/', (req, res) => {
  res.status(200);

  res.write(getResponse());

  res.end();
});

app.set('port', 18181);

const server = http.createServer(app);

reload(app).then(reloadReturned => {
  server.listen(app.get('port'), () => {
    console.log('Web server listening on port ' + app.get('port'))
  })
}).catch(err => {
  console.error('Reload could not start:', err)
})


