import express from 'express';

const app = express();

app.get('/', (req, res) => {
   res.status(200).send({
      message: 'Hello from a ckookontainer',
      service: 'hello-node',
      podname: process.env.POD_NAME || 'unknown',
      time: new Date().toISOString(),
   });
});

app.get('/readyz', (req, res) => {
   res.send('ready');
});

app.get('/healthz', (req, res) => {
   res.send('ok');
});

export default app;
