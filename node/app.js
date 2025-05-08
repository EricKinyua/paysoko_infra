const http = require('http');

// Use PORT env variable, fallback to 3000 if undefined
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.end(`Hello from Node App on port ${port}`);
});

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});