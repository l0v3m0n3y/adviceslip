# adviceslip
api for adviceslip.com advice slip site
# Example
```nim
import asyncdispatch, adviceslip, json, strutils
let data = waitFor random_advice()
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
