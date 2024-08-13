import express from 'express';
import { connectDB } from './config/mongoose-config.js';

function main () {
    const app = express();
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));

    app.get('/api/test', (req, res) => {
        res.send('Hello World!');
    });

    connectDB();

    app.listen(5000, () => {
        console.log('Server is running on port 5000');
    });
}

main();