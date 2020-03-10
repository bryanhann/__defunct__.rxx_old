import os
import sys
component = (sys.argv+[''])[1]
parts = os.environ['PATH'].split(':')
if not component in parts:
    parts = [component] + parts
print(':'.join(parts))
