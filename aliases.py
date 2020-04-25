#!/usr/bin/python2

"""
Set up aliases for dotfiles and folders.
"""
from __future__ import print_function
import sys, os
import shutil

base = os.path.dirname(os.path.realpath(__file__))
home = os.environ['HOME']

print("Base Dir: {}".format(base))
print("home Dir: {}".format(home))

def link(src, dest):
    try:
        os.symlink(src, dest)
    except OSError as err:
        print("[-] WARNING: Unable to create symlink: {}".format(err))

def main():
    for srcfile in os.listdir(base):
        if srcfile.startswith('dot.'):
            destfile = ".%s" % srcfile[4:]
            src = os.path.join(base, srcfile)
            dest = os.path.join(home, destfile)
            print("[+] Linking {} -> {}".format(src, dest))
            overwrite = False
            if os.path.exists(dest):
                while True:
                    resp = raw_input("\t{} - already exists, would you like to overwrite? [Y/n]? ".format(dest))
                    if resp in ['', 'y','Y']:
                        overwrite = True
                        break
                    elif resp == "n":
                        # skip - don't overwrite
                        break

                if overwrite:
                    backup = "{}.orig".format(dest)
                    shutil.move(dest, backup)
                    print("\tBacked up {} to {}".format(dest, backup))
                    link(src, dest)
                else:
                    print("[-] Skipping: {}".format(dest))
            else:
                link(src, dest)


if __name__ == "__main__":
    main()
