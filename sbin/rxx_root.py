import os
import sys
up = os.sep + '..'
root=sys.argv[0] + (up * 2)
root=os.path.normpath(root)
root=os.path.realpath(root)
print(root)
