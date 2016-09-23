import sys, pprint

class Value:
    pass
class Function:
    pass
class Type:
    pass

class BreakLoop: pass
class ContinueLoop: pass
class ReturnValue: pass

locations = {}
types = {}
functions = {}
globals = {}

def error(s):
    raise RuntimeError(str(s))

def errorIn(pos, s):
    if not id(pos) in locations:
        error('error token %r: %s' % (pos, s))
    else:
        error('%s line %s: %s' % (locations[id(pos)][0], locations[id(pos)][1], s))

def lex(fn):
    st = []
    cur = []

    lineno = 1
    s = open(fn).read()
    locations[id(cur)] = (fn, lineno)

    idChars = '+-*/%&|.<>=!_'

    def handleSemicolons(l):
        nl = []
        s = []
        for i in l:
            if type(i) == str and i[0] == ';':
                locations[id(s)] = (fn, int(i[1:]))
                nl.append(s)
                s = []
            else:
                s.append(i)
        del l[:]
        l.extend(nl)
        l.extend(s)

    while s:
        if s[0].isspace():
            if s[0] == '\n':
                lineno += 1
            s = s[1:]
        elif s[:2] == '//':
            while s[0] != '\n':
                s = s[1:]
        elif s[0] == ';':
            s = s[1:]
            cur.append(";" + str(lineno))
        elif s[0].isdigit() or (s[0] in '+-' and s[1].isdigit()):
            a = ''
            if s[0] in '+-':
                a += s[0]
                s = s[1:]
            while s[0].isdigit():
                a += s[0]
                s = s[1:]
            cur.append(int(a))
        elif s[0].isalpha() or s[0] in idChars:
            a = ''
            while s[0].isalnum() or s[0] in idChars:
                a += s[0]
                s = s[1:]
            cur.append(a)
        elif s[0] == '"':
            s = s[1:]
            a = ''
            while s[0] != '"':
                a += s[0]
                s = s[1:]
            s = s[1:]
            cur.append('"' + a)
#        elif s[:2] == '#\\':
#            s = s[2:]
#            for a,b in (('n', '\n'),):
#                if s.startswith(a):
#                    s = s[len(a):]
#                    cur.append(ord(b))
#                    break
#            else:
#                cur.append(ord(s[0]))
#                s = s[1:]
        elif s[0] == '(':
            s = s[1:]
            cur.append([])
            st.append(cur)
            cur = cur[-1]
            locations[id(cur)] = (fn, lineno)
        elif s[0] == ')':
            if len(st) == 0:
                error('unmatched %s line %d' % (fn, lineno))
            s = s[1:]
            handleSemicolons(cur)
            cur = st.pop()
        else:
            error('lexer hate %s line %d' % (fn, lineno))
    if st:
        error('unexpected eof in %s' % fn)
    handleSemicolons(cur)
    return cur

def parseType(s):
    t = Type()
    if type(s) == str:
        t.type = s
        t.children = []
        return t

    if s[0] == 'ptr':
        t.type = 'ptr'
        t.children = [parseType(s[1])]
    else:
        errorIn(s, "unknown type")

    return t

def typeToStr(t):
    return t.type + ' ' + '[' + ', '.join(map(typeToStr, t.children)) + ']'

def testTypeMatch(s, a, b):
    if not isinstance(a, Value):
        errorIn(s, "not Value here %r" % (a,))
    if not isinstance(b, Value):
        errorIn(s, "not Value here %r" % (b,))
    if a.type == 'NULL' or b.type == 'NULL':
        return
    if typeToStr(a.type) != typeToStr(b.type):
        errorIn(s, 'type mismatch %r %r' % (typeToStr(a.type), typeToStr(b.type)))

lastPos = None

def evaluate(s, scope):
    if type(s) == int:
        v = Value()
        v.type = parseType('int')
        v.value = s
        return v
    elif type(s) == str:
        v = Value()
        if s[0] == '"':
            v.type = parseType('string')
            v.value = s[1:]
            return v
        else:
            return scope[s]
    elif type(s[0]) == list:
        ret = None
        for i in s:
            ret = evaluate(i, scope)
        return ret

    global lastPos
    lastPos = locations[id(s)]

    if s[0] in functions:
        f = functions[s[0]]
        newScope = globals.copy()
        if len(f.params) != len(s[1:]):
            errorIn(s, 'parameter count mismatch')
        for i, j in zip(f.params, s[1:]):
            newScope[i[0]] = evaluate(j, scope)
        try:
            evaluate(f.code, newScope)
        except ReturnValue as v:
            return v.value
        return

    if s[0] == 'exit_failure':
        errorIn(s, "failure exit");

    elif s[0] == 'exit_success':
        sys.exit(0)

    elif s[0] == 'assert':
        if not evaluate(s[1], scope).value:
            errorIn(s, 'assert failed')

    elif s[0] == 'print_int':
        sys.stdout.write(str(evaluate(s[1], scope).value))

    elif s[0] == 'print_string':
        sys.stdout.write(str(evaluate(s[1], scope).value))

    elif s[0] == 'print_char':
        sys.stdout.write(chr(evaluate(s[1], scope).value))

    elif s[0] == 'print_eol':
        sys.stdout.write('\n')

    elif s[0] == 'read_file':
        v = Value()
        v.type = parseType('string')
        v.value = open(evaluate(s[1], scope).value).read()
        return v

    elif s[0] == 'local':
        v = Value()
        v.value = None
        v.type = parseType(s[2])
        if s[1] in scope:
            errorIn(s, 'already defined')
        scope[s[1]] = v

    elif s[0] == 'global':
        v = Value()
        v.value = None
        v.type = parseType(s[2])
        if s[1] in globals:
            errorIn(s, 'already defined')
        globals[s[1]] = v

    elif s[0] == 'while':
        while True:
            v = evaluate(s[1], scope)
            if not v.value:
                break
            try:
                for i in s[2:]:
                    evaluate(i, scope)
            except BreakLoop:
                break
            except ContinueLoop:
                continue

    elif s[0] == 'break':
        raise BreakLoop()

    elif s[0] == 'continue':
        raise ContinueLoop()

    elif s[0] == 'return':
        v = ReturnValue()
        v.value = evaluate(s[1], scope)
        raise v

    elif s[0] == 'if':
        v = evaluate(s[1], scope)
        if v.value:
            return evaluate(s[2], scope)
        else:
            if len(s) >= 4:
                return evaluate(s[3], scope)

    elif s[0] == 'new':
        v = Value()
        v.type = parseType(s[1])
        v.value = {}
        for i,j in types[s[1]].children:
            v.value[i] = Value()
            v.value[i].type = j
            v.value[i].value = None
        return v

    elif s[0] == 'setm':
        a = evaluate(s[2], scope)
        b = evaluate(s[3], scope)
        testTypeMatch(s, a.value[s[1]], b);
        a.value[s[1]] = b

    elif s[0] == 'getm':
        a = evaluate(s[2], scope)
        return a.value[s[1]]

    elif s[0] == 'set':
        v = evaluate(s[2], scope)
        testTypeMatch(s, v, scope[s[1]])
        scope[s[1]] = v

    elif s[0] == 'slice':
        a = evaluate(s[1], scope)
        b = evaluate(s[2], scope)
        c = evaluate(s[3], scope)
        v = Value()
        v.type = parseType('string')
        v.value = a.value[b.value:c.value]
        return v

    elif s[0] == 'char_at':
        a = evaluate(s[1], scope)
        b = evaluate(s[2], scope)
        v = Value()
        v.type = parseType('int')
        v.value = ord(a.value[b.value])
        return v

    elif s[0] == 'length':
        a = evaluate(s[1], scope)
        v = Value()
        v.type = parseType('int')
        v.value = len(a.value)
        return v

    elif s[0] == 'string_eq':
        a = evaluate(s[1], scope)
        b = evaluate(s[2], scope)
        v = Value()
        v.type = parseType('int')
        v.value = a.value == b.value
        return v

    elif s[0] in ('add', 'or', 'eq', 'lt', 'mul', 'and', 'div', 'ge', 'le', 'sub', 'gt'):
        a = evaluate(s[1], scope)
        b = evaluate(s[2], scope)
        v = Value()
        v.type = a.type
        a = a.value
        b = b.value
        r = None
        if s[0] == 'add': r = a + b
        if s[0] == 'sub': r = a - b
        if s[0] == 'mul': r = a * b
        if s[0] == 'div': r = a / b
        if s[0] == 'or': r = a | b
        if s[0] == 'and': r = a & b
        if s[0] == 'eq': r = 1 if a == b else 0
        if s[0] == 'lt': r = 1 if a < b else 0
        if s[0] == 'gt': r = 1 if a > b else 0
        if s[0] == 'ge': r = 1 if a >= b else 0
        if s[0] == 'le': r = 1 if a <= b else 0
        assert r != None
        v.value = r
        return v

    elif s[0] == 'not':
        a = evaluate(s[1], scope)
        v = Value()
        v.type = parseType('int')
        v.value = 0 if a.value else 1
        return v

    elif s[0] == 'neg':
        a = evaluate(s[1], scope)
        v = Value()
        v.type = parseType('int')
        v.value = -a.value
        return v

    elif s[0] == 'is_null':
        a = evaluate(s[1], scope)
        v = Value()
        v.type = parseType('int')
        v.value = 1 if a.type == 'NULL' else 0
        return v

    elif s[0] == 'not_null':
        a = evaluate(s[1], scope)
        v = Value()
        v.type = parseType('int')
        v.value = 0 if a.type == 'NULL' else 1
        return v

    elif s[0] == 'enum':
        for i, j in enumerate(s[1:]):
            v = Value()
            v.value = i
            v.type = parseType('int')
            if j in globals:
                errorIn(s, 'already defined')
            globals[j] = v

    elif s[0] == 'class':
        t = Type()
        t.type = 'class'
        t.children = []
        for i in s[2]:
            t.children.append((i[0], parseType(i[1])))
        types[s[1]] = t 

    elif s[0] == 'fun':
        f = Function()
        f.params = []
        for i in s[2]:
            if type(i) != list:
                errorIn(s[2], 'not list')
            f.params.append((i[0], parseType(i[1])))
        f.ret = parseType(s[3])
        f.code = s[4:]
        functions[s[1]] = f

    elif s[0] == 'include':
        for s in lex(evaluate(s[1], scope).value):
            evaluate(s, scope)

    elif s[0] == 'conditional':
        if s[1] == 'interpreter':
            evaluate(s[2], scope);

    else:
        errorIn(s, 'unknown "%s"' % s[0])

def main(fn):
    scope = {}
    globals['NULL'] = Value()
    globals['NULL'].type = 'NULL'
    globals['NULL'].value = None
    sexp = lex(fn)
    try:
        for s in sexp:
            evaluate(s, scope)
        evaluate(['main', 0, 0, 0, 0], scope) 
    except SystemExit:
        raise
    except:
        print 'Last position', lastPos
        raise

if __name__ == '__main__':
    main(sys.argv[1])
