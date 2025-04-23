# Rasa Chatbot Setup Guide

**Python Version:** 3.9  
**Rasa Version:** 3.6.13

A concise guide to set up, train, and run a Rasa chatbot.

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

Rasa Installation With Docker Conteiner

```bash
# Downloads and starts the docker image
docker run -it -v ${PWD}:/app rasa/rasa:latest-full init --no-prompt

# To train rasa docker image
docker run -it -v ${PWD}:/app rasa/rasa:latest-full train

# To run rasa docker image
docker run -it -v ${PWD}:/app rasa/rasa:latest-full shell
```



