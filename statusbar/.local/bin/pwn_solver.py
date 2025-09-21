#!/usr/bin/env python3

import argparse

from pwn import ELF, context, process, remote


def start():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-f", "--file", type=str, help="Solve on a File", metavar="file"
    )
    parser.add_argument(
        "--remote",
        action="store_true",
        help="Solve on remote connection",
        metavar="remote",
    )
    parser.add_argument("--host", type=str, help="Host to connect to", metavar="host")
    parser.add_argument(
        "-p", "--port", type=int, help="Remote port to connect to", metavar="port"
    )

    args = parser.parse_args()

    if args.remote:
        return remote(args.host, args.port)
    else:
        return process(args.file)


# Binary file name
executable = "./vuln"

elf = context.binary = ELF(executable, checksec=True)

io = start()

#############################################################################
#                           Exploit Goes Here                               #
#############################################################################
