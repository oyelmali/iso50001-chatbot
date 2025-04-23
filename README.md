# Rasa Chatbot Setup Guide

**Python Version:** 3.9  
**Rasa Version:** 3.6.13

A concise guide to set up, train, run and deploy a Rasa chatbot.

## Local Installation

```bash
# Create and activate virtual environment on miniconda 
conda create -n rasa python=3.9
conda activate rasa

# Install Rasa
pip install rasa==3.6.13

# Initialize a new Rasa project
rasa init

# Customize your files and train model
rasa train

# Execute last trained model
rasa shell
```

## Rasa Installation With Docker Conteiner

```bash
# Downloads and starts the docker image
docker run -it -v ${PWD}:/app rasa/rasa:latest-full init --no-prompt

# To train rasa docker image
docker run -it -v ${PWD}:/app rasa/rasa:latest-full train

# To run rasa docker image
docker run -it -v ${PWD}:/app rasa/rasa:latest-full shell
```

## Building and Running a Docker Image

```bash
# Build the Docker image for your Rasa chatbot
docker build -t rasa-chatbot .

# Run the Docker container, mapping the port to your local machine
docker run -p 8080:8080 rasa-chatbot
```

## Deploying Docker Image to Google Cloud Run

```bash
# Log in to your Google Cloud account
gcloud auth login

# Set the active project in your Google Cloud account
gcloud config set project your-project-name

# Configure Docker to use the Google Cloud Container Registry
gcloud auth configure-docker

# Tag your Docker image for Google Cloud Container Registry
docker tag rasa-chatbot gcr.io/your-project-id/rasa-chatbot

# Push the Docker image to Google Cloud Container Registry
docker push gcr.io/your-project-id/rasa-chatbot

# Deploy the Docker image to Google Cloud Run
gcloud run deploy rasa-service --image gcr.io/your-project-id/rasa-chatbot --platform managed --region us-central1 --allow-unauthenticated --memory 4Gi

# Optionally, update the service to ensure a minimum number of instances
gcloud run services update rasa-service --min-instances=1
```

### After these steps, your chatbot application that you created with rasa will be available in an interface.

### You can use it as you wish.


