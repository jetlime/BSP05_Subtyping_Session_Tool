# Generated from SessionType.g4 by ANTLR 4.5.3
from antlr4 import *
from io import StringIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\22")
        buf.write("Q\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4\f\t\f\4\r\t\r\4\16")
        buf.write("\t\16\4\17\t\17\4\20\t\20\4\21\t\21\3\2\3\2\3\3\3\3\3")
        buf.write("\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n")
        buf.write("\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\r\3\r\3\16\3\16")
        buf.write("\3\17\3\17\7\17D\n\17\f\17\16\17G\13\17\3\20\3\20\3\21")
        buf.write("\6\21L\n\21\r\21\16\21M\3\21\3\21\2\2\22\3\3\5\4\7\5\t")
        buf.write("\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20")
        buf.write("\37\21!\22\3\2\5\4\2C\\c|\5\2\62;C\\c|\5\2\13\f\17\17")
        buf.write("\"\"R\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2")
        buf.write("\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2")
        buf.write("\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33")
        buf.write("\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\3#\3\2\2")
        buf.write("\2\5%\3\2\2\2\7\'\3\2\2\2\t)\3\2\2\2\13+\3\2\2\2\r-\3")
        buf.write("\2\2\2\17/\3\2\2\2\21\61\3\2\2\2\23\63\3\2\2\2\25\65\3")
        buf.write("\2\2\2\279\3\2\2\2\31=\3\2\2\2\33?\3\2\2\2\35A\3\2\2\2")
        buf.write("\37H\3\2\2\2!K\3\2\2\2#$\7-\2\2$\4\3\2\2\2%&\7}\2\2&\6")
        buf.write("\3\2\2\2\'(\7\177\2\2(\b\3\2\2\2)*\7]\2\2*\n\3\2\2\2+")
        buf.write(",\7_\2\2,\f\3\2\2\2-.\7=\2\2.\16\3\2\2\2/\60\7.\2\2\60")
        buf.write("\20\3\2\2\2\61\62\7\60\2\2\62\22\3\2\2\2\63\64\7(\2\2")
        buf.write("\64\24\3\2\2\2\65\66\7t\2\2\66\67\7g\2\2\678\7e\2\28\26")
        buf.write("\3\2\2\29:\7g\2\2:;\7p\2\2;<\7f\2\2<\30\3\2\2\2=>\7#\2")
        buf.write("\2>\32\3\2\2\2?@\7A\2\2@\34\3\2\2\2AE\t\2\2\2BD\t\3\2")
        buf.write("\2CB\3\2\2\2DG\3\2\2\2EC\3\2\2\2EF\3\2\2\2F\36\3\2\2\2")
        buf.write("GE\3\2\2\2HI\7~\2\2I \3\2\2\2JL\t\4\2\2KJ\3\2\2\2LM\3")
        buf.write("\2\2\2MK\3\2\2\2MN\3\2\2\2NO\3\2\2\2OP\b\21\2\2P\"\3\2")
        buf.write("\2\2\5\2EM\3\2\3\2")
        return buf.getvalue()


class SessionTypeLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]


    PLUS = 1
    CLPAR = 2
    CRPAR = 3
    SLPAR = 4
    SRPAR = 5
    SEMIC = 6
    COMMA = 7
    DOT = 8
    AND = 9
    REC = 10
    END = 11
    OUT = 12
    IN = 13
    ID = 14
    PRL = 15
    WHITESP = 16

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'+'", "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'&'", 
            "'rec'", "'end'", "'!'", "'?'", "'|'" ]

    symbolicNames = [ "<INVALID>",
            "PLUS", "CLPAR", "CRPAR", "SLPAR", "SRPAR", "SEMIC", "COMMA", 
            "DOT", "AND", "REC", "END", "OUT", "IN", "ID", "PRL", "WHITESP" ]

    ruleNames = [ "PLUS", "CLPAR", "CRPAR", "SLPAR", "SRPAR", "SEMIC", "COMMA", 
                  "DOT", "AND", "REC", "END", "OUT", "IN", "ID", "PRL", 
                  "WHITESP" ]

    grammarFileName = "SessionType.g4"

    def __init__(self, input=None):
        super().__init__(input)
        self.checkVersion("4.5.3")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


