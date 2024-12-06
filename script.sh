#!/bin/bash

# Script to generate a README.md file with Electron + React app instructions

OUTPUT_FILE="README.md"

# Content of the Markdown file
cat <<EOL > $OUTPUT_FILE
# Getting Started

Follow these steps to set up and run the Electron + React application:

## Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (LTS version recommended)
- [npm](https://www.npmjs.com/) or [Yarn](https://yarnpkg.com/) for dependency management

## Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd electron_react_app
   \`\`\`

2. Install dependencies for the Electron app and React client:
   \`\`\`bash
   npm install
   cd react-client && npm install
   \`\`\`

3. Create a \`.env\` file in the root directory with your environment variables:
   \`\`\`bash
   touch .env
   \`\`\`
   Add environment-specific variables in the \`.env\` file, such as API URLs, ports, or secret keys:
   \`\`\`
   REACT_APP_API_URL=http://localhost:5000
   ELECTRON_APP_SECRET=your-secret-key
   \`\`\`

## Development

1. Start the React client:
   \`\`\`bash
   cd react-client
   npm run dev
   \`\`\`

2. In a separate terminal, start the Electron main process:
   \`\`\`bash
   cd ..
   npm start
   \`\`\`

The Electron app will launch, and the React client will be served within it.

## Explanation of \`scripts\` in \`package.json\`

Here are the key \`scripts\` defined in the root \`package.json\`:

- \`start\`: Runs both the Electron app and the React client concurrently using [concurrently](https://www.npmjs.com/package/concurrently).
  - \`serve\`: Builds the main and renderer processes using Webpack in development mode and then starts the React client.
  - \`electron\`: Waits for the React client to be available at \`http://localhost:5173\` and then launches the Electron app.

- \`build\`: Creates production builds for both the Electron main and renderer processes, and the React client.

- \`package\`: Packages the Electron app into a distributable format using [electron-builder](https://www.electron.build/).

## Production Build

1. Build the React client:
   \`\`\`bash
   cd react-client
   npm run build
   \`\`\`

2. Package the Electron app:
   \`\`\`bash
   cd ..
   npm run build
   \`\`\`

3. Create a distributable package:
   \`\`\`bash
   npm run package
   \`\`\`

This will generate the compiled output in the \`dist/\` directory and a distributable package.

## Directory Structure

Here's a brief overview of the project's structure:

\`\`\`plaintext
electron_react_app/
├── dist/                           # Compiled output files
├── react-client/                   # React front-end application
├── src/                            # Node.js backend and Electron main/preload scripts
├── webpack.main.config.cjs         # Webpack config for Electron main process
├── webpack.renderer.config.cjs     # Webpack config for Electron preload scripts
└── ...
\`\`\`

## License

This project is licensed under the [MIT License](LICENSE).
EOL

echo "README.md file has been created with the Getting Started guide."
