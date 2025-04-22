FROM python:3.9-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Sadece gerekli dosyaları kopyala
# Önce config dosyalarını kopyala
COPY config.yml domain.yml endpoints.yml credentials.yml ./

# Sadece en son eğitilmiş modeli kopyala (models klasöründeki en son modeli alır)
# Eğer models klasöründe çok fazla model varsa, sadece en son olanı kopyalayacak
COPY models/20250422-021218-latent-trip.tar.gz ./models/

# Sadece gerekli data dosyalarını kopyala
COPY data/ ./data/


# Rasa'nın belirli bir versiyonunu yükle
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc && \
    pip install --no-cache-dir rasa==3.6.13 && \
    apt-get purge -y --auto-remove gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cloud Run, 8080 portunu dinler
ENV PORT=8080

# Rasa'yı 8080 portunda çalıştır
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "8080"]