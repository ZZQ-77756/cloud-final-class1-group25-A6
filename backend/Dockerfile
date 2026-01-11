FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
COPY app.py .
CMD ["python", "app.py"]
