# Local Documentation Build

## Install dependencies

```bash
pip install -r docs/requirements.txt
```

## Build docs with warnings as errors

```bash
sphinx-build -n -W docs docs/_build/html
```

Open `docs/_build/html/index.html` in a browser to preview.
