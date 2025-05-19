FROM python:3.11-slim

# Install Node.js (for CDK CLI) + Git
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g aws-cdk && \
    pip install --upgrade pip

# Add deploy script
COPY deploy.sh /deploy.sh
RUN chmod +x /deploy.sh

CMD ["/deploy.sh"]
