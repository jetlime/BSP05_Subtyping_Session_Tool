# Generated from SessionType.g4 by ANTLR 4.8
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\23")
        buf.write("U\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4\f\t\f\4\r\t\r\4\16")
        buf.write("\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22\3\2\3\2")
        buf.write("\3\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3")
        buf.write("\t\3\n\3\n\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\r\3\r")
        buf.write("\3\16\3\16\3\17\3\17\7\17F\n\17\f\17\16\17I\13\17\3\20")
        buf.write("\3\20\3\21\3\21\3\22\6\22P\n\22\r\22\16\22Q\3\22\3\22")
        buf.write("\2\2\23\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f")
        buf.write("\27\r\31\16\33\17\35\20\37\21!\22#\23\3\2\5\4\2C\\c|\5")
        buf.write("\2\62;C\\c|\5\2\13\f\17\17\"\"\2V\2\3\3\2\2\2\2\5\3\2")
        buf.write("\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2")
        buf.write("\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2")
        buf.write("\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37")
        buf.write("\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\3%\3\2\2\2\5\'\3\2\2\2")
        buf.write("\7)\3\2\2\2\t+\3\2\2\2\13-\3\2\2\2\r/\3\2\2\2\17\61\3")
        buf.write("\2\2\2\21\63\3\2\2\2\23\65\3\2\2\2\25\67\3\2\2\2\27;\3")
        buf.write("\2\2\2\31?\3\2\2\2\33A\3\2\2\2\35C\3\2\2\2\37J\3\2\2\2")
        buf.write("!L\3\2\2\2#O\3\2\2\2%&\7-\2\2&\4\3\2\2\2\'(\7}\2\2(\6")
        buf.write("\3\2\2\2)*\7\177\2\2*\b\3\2\2\2+,\7]\2\2,\n\3\2\2\2-.")
        buf.write("\7_\2\2.\f\3\2\2\2/\60\7=\2\2\60\16\3\2\2\2\61\62\7.\2")
        buf.write("\2\62\20\3\2\2\2\63\64\7\60\2\2\64\22\3\2\2\2\65\66\7")
        buf.write("(\2\2\66\24\3\2\2\2\678\7t\2\289\7g\2\29:\7e\2\2:\26\3")
        buf.write("\2\2\2;<\7g\2\2<=\7p\2\2=>\7f\2\2>\30\3\2\2\2?@\7#\2\2")
        buf.write("@\32\3\2\2\2AB\7A\2\2B\34\3\2\2\2CG\t\2\2\2DF\t\3\2\2")
        buf.write("ED\3\2\2\2FI\3\2\2\2GE\3\2\2\2GH\3\2\2\2H\36\3\2\2\2I")
        buf.write("G\3\2\2\2JK\7~\2\2K \3\2\2\2LM\7&\2\2M\"\3\2\2\2NP\t\4")
        buf.write("\2\2ON\3\2\2\2PQ\3\2\2\2QO\3\2\2\2QR\3\2\2\2RS\3\2\2\2")
        buf.write("ST\b\22\2\2T$\3\2\2\2\5\2GQ\3\2\3\2")
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
    DUALPRL = 16
    WHITESP = 17

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'+'", "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'&'", 
            "'rec'", "'end'", "'!'", "'?'", "'|'", "'$'" ]

    symbolicNames = [ "<INVALID>",
            "PLUS", "CLPAR", "CRPAR", "SLPAR", "SRPAR", "SEMIC", "COMMA", 
            "DOT", "AND", "REC", "END", "OUT", "IN", "ID", "PRL", "DUALPRL", 
            "WHITESP" ]

    ruleNames = [ "PLUS", "CLPAR", "CRPAR", "SLPAR", "SRPAR", "SEMIC", "COMMA", 
                  "DOT", "AND", "REC", "END", "OUT", "IN", "ID", "PRL", 
                  "DUALPRL", "WHITESP" ]

    grammarFileName = "SessionType.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


