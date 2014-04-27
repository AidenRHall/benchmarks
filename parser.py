from collections import OrderedDict
import sys


# Add alternate output lengths to lens variable
# such that the title your benchmark outputs
# is the key to the corresponding value in lens
#
# Default value is 1
global lens
lens = {
        
        }

def n_pairs(to_iter, n):
    it = iter(to_iter)
    for lines in zip(*[ it for i in xrange(n + 1) ]):
        yield lines[0], '\n'.join(lines[1:])

def parse(f):
    global lens
    tests = f.read().split('\n\n')
    parsed = []
    for test in tests:
        info = OrderedDict()
        lines = filter(lambda s: s, test.split('\n'))
        info['title'], lines = lines[0], lines[1:]
        for inputv, outputv in n_pairs(lines, lens[info['title']]\
                                                if info['title'] in lens.keys()\
                                                else 1):
            info[inputv] = outputv
        parsed.append(info)
    return parsed

def writeline(key, info1, info2):
    print ''
    print key
    for line1, line2 in zip(info1.split('\n'), info2.split('\n')):
        print '\t'.join((line1, line2))

def tabify(inpt, jval, oval):
    inshift = 4
    tablen = 7
    lines = jval.count('\n')
    jval = jval.split('\n')
    oval = oval.split('\n')
    jshift = inshift - len(inpt)/8
    oshift = tablen - len(jval[0])/8
    construct = ''.join((inpt, jshift*'\t', jval[0], oshift*'\t', oval[0]))
    for j, o in zip(jval[1:], oval[1:]):
        oshift = tablen - len(j)/8
        construct += '\n' + ''.join((inshift*'\t', j, oshift*'\t', o))
    return construct

def output(info):
    if len(info) > 2:
        usage('info length is %d > 2 in write' % len(info))
    for julia, octave in zip(info[0], info[1]):
        if julia['title'] == octave['title']:
            print 'TEST:', julia['title']
        else:
            print 'TEST:', julia['title'], 'or', octave['title']
        print 'input', 4*'\t', 'Julia', 7*'\t', 'Octave'
        del julia['title']
        del octave['title']
        for (jk, jval), (ok, oval) in zip(julia.items(), octave.items()):
            if jk == ok:
                print tabify(jk, jval, oval)
        print ''

def usage(msg="couldn't tell what went wrong"):
    print 'PARSER: error while running,', msg
    sys.exit(0)

def main(args):
    info = [ parse(open(f, 'r')) for f in args ]
    output(info)

if __name__ == '__main__':
    if len(sys.argv) < 3:
        usage('not enough arguments passed')
    else:
        main(sys.argv[1:])
