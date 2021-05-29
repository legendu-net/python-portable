#!/usr/bin/env python3
from pathlib import Path
BASE_DIR = Path(__file__).parent
EXCLUDE = ("run.sh", "env_pyspark_optimus.sh", )

paths = [str(path) for path in BASE_DIR.glob("*.sh") if path.name not in EXCLUDE and not path.with_suffix(".tar.gz").is_file()]
if paths:
    raise FileNotFoundError(f"The following environment(s) failed to build:\n{' '.join(paths)}")
