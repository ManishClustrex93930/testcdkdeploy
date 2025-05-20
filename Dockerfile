FROM python:3.11-slim

# Install Node.js, Git, bash
RUN apt-get update && \
    apt-get install -y curl git bash && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g aws-cdk && \
    pip install --upgrade pip

# Copy and set permissions for deploy script
COPY deploy.sh /usr/local/bin/deploy.sh
RUN chmod +x /usr/local/bin/deploy.sh

CMD ["bash", "/usr/local/bin/deploy.sh"]
