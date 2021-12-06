// Generated from c:\Users\jeane\Documents\Semestre 5\BSP_05\Subtyping_Session_Tool_SourceCode\TEST_SubTyping_Session_Tool_Source_Code\SessionType.g4 by ANTLR 4.8
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SessionTypeLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		PLUS=1, CLPAR=2, CRPAR=3, SLPAR=4, SRPAR=5, SEMIC=6, COMMA=7, DOT=8, AND=9, 
		REC=10, END=11, OUT=12, IN=13, ID=14, PRL=15, WHITESP=16;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"PLUS", "CLPAR", "CRPAR", "SLPAR", "SRPAR", "SEMIC", "COMMA", "DOT", 
			"AND", "REC", "END", "OUT", "IN", "ID", "PRL", "WHITESP"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'+'", "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'&'", 
			"'rec'", "'end'", "'!'", "'?'", null, "'|'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "PLUS", "CLPAR", "CRPAR", "SLPAR", "SRPAR", "SEMIC", "COMMA", "DOT", 
			"AND", "REC", "END", "OUT", "IN", "ID", "PRL", "WHITESP"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public SessionTypeLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "SessionType.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\22Q\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\3\2\3\2\3"+
		"\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3"+
		"\13\3\13\3\13\3\f\3\f\3\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17\7\17D\n\17\f"+
		"\17\16\17G\13\17\3\20\3\20\3\21\6\21L\n\21\r\21\16\21M\3\21\3\21\2\2\22"+
		"\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20"+
		"\37\21!\22\3\2\5\4\2C\\c|\5\2\62;C\\c|\5\2\13\f\17\17\"\"\2R\2\3\3\2\2"+
		"\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3"+
		"\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2"+
		"\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\3#\3\2\2\2\5%\3\2"+
		"\2\2\7\'\3\2\2\2\t)\3\2\2\2\13+\3\2\2\2\r-\3\2\2\2\17/\3\2\2\2\21\61\3"+
		"\2\2\2\23\63\3\2\2\2\25\65\3\2\2\2\279\3\2\2\2\31=\3\2\2\2\33?\3\2\2\2"+
		"\35A\3\2\2\2\37H\3\2\2\2!K\3\2\2\2#$\7-\2\2$\4\3\2\2\2%&\7}\2\2&\6\3\2"+
		"\2\2\'(\7\177\2\2(\b\3\2\2\2)*\7]\2\2*\n\3\2\2\2+,\7_\2\2,\f\3\2\2\2-"+
		".\7=\2\2.\16\3\2\2\2/\60\7.\2\2\60\20\3\2\2\2\61\62\7\60\2\2\62\22\3\2"+
		"\2\2\63\64\7(\2\2\64\24\3\2\2\2\65\66\7t\2\2\66\67\7g\2\2\678\7e\2\28"+
		"\26\3\2\2\29:\7g\2\2:;\7p\2\2;<\7f\2\2<\30\3\2\2\2=>\7#\2\2>\32\3\2\2"+
		"\2?@\7A\2\2@\34\3\2\2\2AE\t\2\2\2BD\t\3\2\2CB\3\2\2\2DG\3\2\2\2EC\3\2"+
		"\2\2EF\3\2\2\2F\36\3\2\2\2GE\3\2\2\2HI\7~\2\2I \3\2\2\2JL\t\4\2\2KJ\3"+
		"\2\2\2LM\3\2\2\2MK\3\2\2\2MN\3\2\2\2NO\3\2\2\2OP\b\21\2\2P\"\3\2\2\2\5"+
		"\2EM\3\2\3\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}