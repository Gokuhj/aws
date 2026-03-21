from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from AWS CodeBuild + Docker! 🚀"

if __name__ == "__main__":
    # Runs locally (not used in container)
    app.run(host="0.0.0.0", port=5000)