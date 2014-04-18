import sys


def parse(f, infolen=1):
    tests = f.read().split('\n\n')
    for test in tests:
        info = {}
        line = test.split('\n')
        bench_info['title'], lines = lines[0], lines[1:]
        for inputv, outputv in zip(lines, lines):
            # TODO make it so that we're iterating correctly
            # over the inputs and outputs of f
            raise NotImplementedError
            info[inputv] = outputv

def writeline(key, info1, info2):
    print ''
    print key
    for line1, line2 in zip(info1.split('\n'), info2.split('\n')):
        print '\t'.join((line1, line2))

def write(info):
    if len(info) > 2:
        usage('info length is %d > 2 in write' % len(info))
    info1 = info[0]
    info2 = info[1]
    # TODO iterate through different test cases
    raise NotImplementedError

def usage(msg="couldn't tell what went wrong"):
    print 'PARSER: error while running,', msg
    sys.exit(0)

def main(args):
    info = [ parse(f) for f in args ]
    write(info)

if __name__ == '__main__':
    if len(sys.argv) < 3:
        usage('not enough arguments passed')
    else:
        main(sys.argv[1:])
