#!/usr/bin/env python3

# ============================================================
#                   </> : TOOL NAME OPN ||
#                       OWNER : Krishn 🔱 
# 		   </> :  FOLLW IN INSTAGRAM : ur_.krishn._02
# ============================================================

import base64
import gzip
import os
import subprocess
import sys


PAYLOAD = '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'

FILE_TYPE = '.sh'


def load_source():

    try:

        data = base64.b64decode(
            PAYLOAD
        )

        return gzip.decompress(
            data
        )

    except Exception as error:

        print(
            "[OPN] Payload error:",
            error
        )

        return None


def run_python(source):

    try:

        # Preserve the original command-line arguments.
        sys.argv[0] = os.path.abspath(__file__)

        code = compile(
            source.decode("utf-8-sig"),
            "<OPN-Protected-Python>",
            "exec"
        )

        namespace = {
            "__name__": "__main__",
            "__file__": os.path.abspath(__file__),
            "__package__": None,
            "__cached__": None,
        }

        exec(
            code,
            namespace,
            namespace
        )

        return 0

    except SystemExit as error:

        # Preserve normal sys.exit() behavior.
        if error.code is None:
            return 0

        if isinstance(error.code, int):
            return error.code

        print(error.code)
        return 1

    except Exception as error:

        print(
            "[OPN] Python execution error:",
            error
        )

        return 1


def run_bash(source):

    try:

        # Execute through the system bash while preserving
        # the current environment and command-line arguments.
        result = subprocess.run(
            [
                "bash",
                "-c",
                source.decode("utf-8-sig"),
                "OPN-PROTECTED",
                *sys.argv[1:]
            ],
            env=os.environ.copy(),
            cwd=os.getcwd()
        )

        return result.returncode

    except Exception as error:

        print(
            "[OPN] Bash execution error:",
            error
        )

        return 1


def main():

    source = load_source()

    if source is None:
        return 1

    if FILE_TYPE == ".py":
        return run_python(source)

    if FILE_TYPE == ".sh":
        return run_bash(source)

    print(
        "[OPN] Unsupported file type."
    )

    return 1


if __name__ == "__main__":

    try:

        sys.exit(
            main()
        )

    except KeyboardInterrupt:

        print(
            "\n[OPN] Stopped by user."
        )

        sys.exit(130)

    except Exception as error:

        print(
            "[OPN] Unexpected error:",
            error
        )

        sys.exit(1)
