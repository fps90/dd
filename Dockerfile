# استخدام Ubuntu 22.04 (Jammy)
FROM ubuntu:jammy

# تعطيل تنفيذ سكربت Leapcell التلقائي
ENV DISABLE_ENTRYPOINT=1

# تحديث النظام وتثبيت المتطلبات الأساسية
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y git libxrender1 python3-pip ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ جميع الملفات إلى الحاوية
COPY . .

# تثبيت المتطلبات من ملف requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# تشغيل التطبيق عند بدء الحاوية
CMD ["python3", "-m", "AdityaHalder"]
