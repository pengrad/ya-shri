#!/usr/bin/env python

import argparse

parser = argparse.ArgumentParser(description='Print the number of arguments.')
parser.add_argument('arguments', metavar='ARG', type=str, nargs='*', help='some arguments')
parser.add_argument('-m', dest='message', default='', help='custom message')
parser.add_argument('-v', dest='verbose', action='store_true', help='print each argument')

args = parser.parse_args()

count = 0

for a in args.arguments:
    count += 1
    if args.verbose:
        print(a)

if args.message != '':
    print(args.message)

print(count)