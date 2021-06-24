# Twfarm

## How to Run
```
host> $ docker build -t tw-farm .
host> $ docker run --rm -it tw-farm
```

## How to Play
```bash
# 0. List commands
docker> $ termworld

# 1. List seeds
docker> $ termworld seeds

# 2. List fields
docker> $ termworld fields

# 3. Display field detail with シェル芸
docker> $ termworld fields --detail `termworld fields | awk 'NR>1' | awk '{print $2}' | cut -d ',' -f 1`

# Other commands are not working
# This project development is not active, sorry😢
```
