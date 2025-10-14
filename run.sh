#!/bin/bash

# Smart Waste Classification System Launch Script
# Smart Waste Classification System Launch Script

echo "🚀 Starting Smart Waste Classification System..."

# Check Python environment
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python3 not found, please install Python 3.8+"
    exit 1
fi

# Check virtual environment
if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo "⚠️  Warning: It's recommended to run the application in a virtual environment"
    echo "💡 Tip: Create virtual environment: python3 -m venv venv && source venv/bin/activate"
fi

# Check dependencies
echo "📦 Checking dependencies..."
python3 -c "import streamlit, torch, ultralytics, openai, PIL" 2>/dev/null || {
    echo "❌ Error: Missing required dependencies"
    echo "💡 Tip: Please run 'pip install -r requirements.txt' to install dependencies"
    exit 1
}

# Check CSS file
if [[ ! -f "style.css" ]]; then
    echo "❌ Error: style.css file not found"
    echo "💡 Tip: Please ensure style.css file is in the current directory"
    exit 1
fi

# Launch application
echo "✅ Environment check completed, starting application..."
echo "🌐 Access URL: http://localhost:8501"
echo "⚠️  Please ensure you have your Qwen API key ready"
echo "🔍 Press Ctrl+C to stop the application"
echo ""

streamlit run app.py --server.port=8501 --server.address=0.0.0.0