# Base image
FROM node:20

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libfontconfig1 \
        libfreetype6 \
        libjpeg62-turbo \
        libx11-6 \
        libxcb1 \
        libxext6 \
        libxrender1 \
        wkhtmltopdf \
        wget \
        xfonts-75dpi \
        xfonts-base \
    && rm -rf /var/lib/apt/lists/*


# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY wkhtmltopdf-package*.json ./package.json
RUN npm install

# Bundle app source
COPY . .

# Expose port
EXPOSE 3000

# Run the app
CMD [ "node", "wkhtmltopdf.js" ]
