const express = require('express');

const app = express();

app.get('/', (req, res) => {
  return res.json({
    evento: 'Semana Omnistack',
    aluno: 'Lucas Gehlen'
  });
});

app.listen(3001);