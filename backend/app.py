from flask import Flask, jsonify
import redis
import os

app = Flask(__name__)
# 连接到名为 'redis' 的容器，端口 6379
r = redis.Redis(host='redis', port=6379, decode_responses=True)

@app.route('/api/hello')
def hello():
    # 计数器 +1
    count = r.incr('hits')
    return jsonify({
        "message": "Hello from Python Backend!",
        "visit_count": count,
        "student": os.environ.get("STUDENT_NAME", "Unknown")
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
