FROM python:3.9-slim

# Çalışma dizini
WORKDIR /app


COPY config.yml domain.yml endpoints.yml credentials.yml ./

# En son eğitilmiş modeli kopyalar
COPY models/20250422-021218-latent-trip.tar.gz ./models/

# Sadece gerekli data dosyalarını kopyala
COPY data/ ./data/


# Rasa 3.6.13 yükler
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc && \
    pip install --no-cache-dir rasa==3.6.13 && \
    apt-get purge -y --auto-remove gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cloud Run, 8080 portunda çalışır
ENV PORT=8080


CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8080"]