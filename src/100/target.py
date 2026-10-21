from pathlib import Path

folder = Path.cwd()

# Match .s and .S (case-insensitive) files in the current folder only
count = sum(1 for p in folder.iterdir() if p.is_file() and p.suffix.lower() == ".s")

if count >= 100:
    print("We hit the target lets fucking gooo")
else:
    print(f"{count} / 100 done ")
