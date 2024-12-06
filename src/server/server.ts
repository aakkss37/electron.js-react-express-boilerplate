// src/server/server.ts
import express, { Request, Response, NextFunction } from 'express';
import cors from 'cors';

const app = express();
const PORT = process.env.EXPRESS_PORT || 3001;
// Enable CORS for all routes (for testing purposes)
app.use(cors());

// Alternatively, configure CORS more securely in production

app.use(cors({
    origin: 'http://localhost:5173',
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    credentials: true,
}));


export function startServer() {
    app.get('/api', (req: Request, res: Response) => {
        res.json({ message: 'Hello from the Express server!' });
    });

    // Handle 404
    app.use((req: Request, res: Response, next: NextFunction) => {
        res.status(404).json({ error: 'Not Found' });
    });

    // Global Error Handler
    app.use((err: any, req: Request, res: Response, next: NextFunction) => {
        console.error(err.stack);
        res.status(500).json({ error: 'Internal Server Error' });
    });

    const server = app.listen(PORT, () => {
        console.log(`Express server is running on http://localhost:${PORT}`);
    });

    return server;
}
