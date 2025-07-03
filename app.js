const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Servire fișiere statice (CSS, JS, imagini)
 app.use(express.static(path.join(__dirname, 'public')));

// // Pagina principală
 app.get('/', (req, res) => {
     res.sendFile(path.join(__dirname, 'views', 'index.html'));
     });

//     // Pornire server
     app.listen(PORT, () => {
         console.log(`Server running on http://localhost:${PORT}`);
         });

