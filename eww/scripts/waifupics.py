#!/usr/bin/python3

import requests
import os
import sys

API_URL = "https://api.waifu.im/images"

# Build API parameters
params = {}

if len(sys.argv) > 1 and sys.argv[1] == "--segs":
    params["IsNsfw"] = "True"

    if len(sys.argv) > 2:
        params["IncludedTags"] = sys.argv[2]
else:
    # Default: SFW
    params["IsNsfw"] = "False"

    if len(sys.argv) > 1:
        params["IncludedTags"] = sys.argv[1]

# Ask for one random image
params["PageSize"] = 1
params["OrderBy"] = "Random"

try:
    response = requests.get(
        API_URL,
        params=params,
        headers={"Accept-Version": "v7"},
        timeout=10
    )
    response.raise_for_status()

    data = response.json()

    if not data.get("items"):
        print("No images found.")
        sys.exit(1)

    link = data["items"][0]["url"]

    # Download to a temporary file first so we don't destroy
    # the existing image if the download fails.
    tmp = "eww_covers/waifu_tmp"
    final = "eww_covers/waifu"

    download = requests.get(link, timeout=10)
    download.raise_for_status()

    with open(tmp, "wb") as f:
        f.write(download.content)

    os.replace(tmp, final)

    print(final)

except requests.RequestException as e:
    print("Request failed:", e)
    sys.exit(1)
except (KeyError, IndexError, ValueError) as e:
    print("Invalid API response:", e)
    sys.exit(1)
