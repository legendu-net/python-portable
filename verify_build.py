#!/usr/bin/env python3
from pathlib import Path
BASE_DIR = Path(__file__).parent
EXCLUDE = ("run.sh", "env_pyspark_optimus.sh", )

for path in BASE_DIR.glob("*.sh"):
    if path.name not in EXCLUDE and not path.with_suffix(".tar.gz").is_file():
        raise FileNotFoundError(f"{path} was not built successfully!")
