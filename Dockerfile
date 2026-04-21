FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

# Dependencies for building some packages
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "bot.py"]   # ya jo bhi tumhara main file hai (bot.py / main.py / index.py)
