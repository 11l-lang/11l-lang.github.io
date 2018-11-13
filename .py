import os, sys

for root, dirs, files in os.walk('doc'):
    #dirs[:] = [d for d in dirs if d != 'ru']
    for name in files:
        if name.endswith(".pq"):
            full_name = os.path.join(root, name)
            if name != '.pq':
                os.makedirs(os.path.splitext(full_name)[0], exist_ok = True)
                outfname = os.path.splitext(full_name)[0] + '/index.html'
            else:
                assert(os.path.dirname(full_name) == root)
                outfname = root + '/index.html'
            if os.system(R'python C:\!!BITBUCKET\pqmarkup\pqmarkup.py --output-html-document "' + full_name + '" -f "' + outfname + '"') != 0:
                sys.exit("Error in file '" + full_name + "'")
