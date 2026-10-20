PYTHON ?= python3.12

.PHONY: venv
venv:
	$(PYTHON) -m venv venv
	./venv/bin/python -m pip install --upgrade pip
	./venv/bin/python -m pip install -r requirements.txt

# Recommendation engine (FastAPI)
.PHONY: run
run:
	uvicorn backend.api:app --host 0.0.0.0 --port 8000

# Generic, category-agnostic configuration UI (Gradio)
.PHONY: run-ui
run-ui:
	python frontend/client_interface.py

# Domain-specific demo storefronts (Panel)
.PHONY: run-laptop-demo
run-laptop-demo:
	panel serve frontend/demos/laptop_demo.py

.PHONY: run-movie-demo
run-movie-demo:
	panel serve frontend/demos/movie_demo.py

.PHONY: run-news-demo
run-news-demo:
	panel serve frontend/demos/news_demo.py
