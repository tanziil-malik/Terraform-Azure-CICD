const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('🚀 Terraform + Node.js App successfully deployed on Azure!');
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`✅ Server running on port ${PORT}`));
