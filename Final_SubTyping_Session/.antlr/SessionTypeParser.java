// Generated from c:\Users\jeane\Documents\Semestre 5\BSP_05\Subtyping_Session_Tool_SourceCode\TEST_SubTyping_Session_Tool_Source_Code\SessionType.g4 by ANTLR 4.8
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SessionTypeParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		PLUS=1, CLPAR=2, CRPAR=3, SLPAR=4, SRPAR=5, SEMIC=6, COMMA=7, DOT=8, AND=9, 
		REC=10, END=11, OUT=12, IN=13, ID=14, PRL=15, WHITESP=16;
	public static final int
		RULE_start = 0, RULE_stype = 1, RULE_sprimetype = 2, RULE_guarded = 3;
	private static String[] makeRuleNames() {
		return new String[] {
			"start", "stype", "sprimetype", "guarded"
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

	@Override
	public String getGrammarFileName() { return "SessionType.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public SessionTypeParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class StartContext extends ParserRuleContext {
		public  type;
		public StypeContext s;
		public TerminalNode EOF() { return getToken(SessionTypeParser.EOF, 0); }
		public StypeContext stype() {
			return getRuleContext(StypeContext.class,0);
		}
		public StartContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_start; }
	}

	public final StartContext start() throws RecognitionException {
		StartContext _localctx = new StartContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_start);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(8);
			((StartContext)_localctx).s = stype();
			_localctx.type = ((StartContext)_localctx).s.type if ((StartContext)_localctx).s.type is not None else ""
			setState(10);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StypeContext extends ParserRuleContext {
		public  type;
		public Token i;
		public Token s;
		public StypeContext st;
		public Token c;
		public Token i2;
		public Token s2;
		public StypeContext st2;
		public Token r;
		public Token d;
		public GuardedContext g;
		public Token e;
		public Token o;
		public Token prl;
		public SprimetypeContext spt;
		public Token sl;
		public Token o2;
		public Token sr;
		public Token n;
		public Token n2;
		public TerminalNode PLUS() { return getToken(SessionTypeParser.PLUS, 0); }
		public TerminalNode CLPAR() { return getToken(SessionTypeParser.CLPAR, 0); }
		public TerminalNode CRPAR() { return getToken(SessionTypeParser.CRPAR, 0); }
		public List<TerminalNode> ID() { return getTokens(SessionTypeParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(SessionTypeParser.ID, i);
		}
		public List<TerminalNode> SEMIC() { return getTokens(SessionTypeParser.SEMIC); }
		public TerminalNode SEMIC(int i) {
			return getToken(SessionTypeParser.SEMIC, i);
		}
		public List<StypeContext> stype() {
			return getRuleContexts(StypeContext.class);
		}
		public StypeContext stype(int i) {
			return getRuleContext(StypeContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(SessionTypeParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(SessionTypeParser.COMMA, i);
		}
		public TerminalNode AND() { return getToken(SessionTypeParser.AND, 0); }
		public TerminalNode REC() { return getToken(SessionTypeParser.REC, 0); }
		public TerminalNode DOT() { return getToken(SessionTypeParser.DOT, 0); }
		public GuardedContext guarded() {
			return getRuleContext(GuardedContext.class,0);
		}
		public TerminalNode END() { return getToken(SessionTypeParser.END, 0); }
		public List<TerminalNode> OUT() { return getTokens(SessionTypeParser.OUT); }
		public TerminalNode OUT(int i) {
			return getToken(SessionTypeParser.OUT, i);
		}
		public TerminalNode PRL() { return getToken(SessionTypeParser.PRL, 0); }
		public SprimetypeContext sprimetype() {
			return getRuleContext(SprimetypeContext.class,0);
		}
		public TerminalNode SLPAR() { return getToken(SessionTypeParser.SLPAR, 0); }
		public TerminalNode SRPAR() { return getToken(SessionTypeParser.SRPAR, 0); }
		public List<TerminalNode> IN() { return getTokens(SessionTypeParser.IN); }
		public TerminalNode IN(int i) {
			return getToken(SessionTypeParser.IN, i);
		}
		public StypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stype; }
	}

	public final StypeContext stype() throws RecognitionException {
		StypeContext _localctx = new StypeContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_stype);
		int _la;
		try {
			setState(128);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,4,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(12);
				match(PLUS);
				setState(13);
				match(CLPAR);
				_localctx.type = "["
				setState(15);
				((StypeContext)_localctx).i = match(ID);
				setState(16);
				((StypeContext)_localctx).s = match(SEMIC);
				setState(17);
				((StypeContext)_localctx).st = stype();
				_localctx.type += "!" + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).s!=null?((StypeContext)_localctx).s.getText():null) + (((StypeContext)_localctx).st.type if not ((StypeContext)_localctx).st.type == None else "") 
				setState(27);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(19);
					((StypeContext)_localctx).c = match(COMMA);
					setState(20);
					((StypeContext)_localctx).i2 = match(ID);
					setState(21);
					((StypeContext)_localctx).s2 = match(SEMIC);
					setState(22);
					((StypeContext)_localctx).st2 = stype();
					_localctx.type += (((StypeContext)_localctx).c!=null?((StypeContext)_localctx).c.getText():null) + "!" + (((StypeContext)_localctx).i2!=null?((StypeContext)_localctx).i2.getText():null) + (((StypeContext)_localctx).s2!=null?((StypeContext)_localctx).s2.getText():null) + (((StypeContext)_localctx).st2.type if not ((StypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(29);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				_localctx.type += "]"
				setState(31);
				match(CRPAR);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(33);
				match(AND);
				setState(34);
				match(CLPAR);
				_localctx.type = "["
				setState(36);
				((StypeContext)_localctx).i = match(ID);
				setState(37);
				((StypeContext)_localctx).s = match(SEMIC);
				setState(38);
				((StypeContext)_localctx).st = stype();
				_localctx.type += "?" + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).s!=null?((StypeContext)_localctx).s.getText():null) + (((StypeContext)_localctx).st.type if not ((StypeContext)_localctx).st.type == None else "") 
				setState(48);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(40);
					((StypeContext)_localctx).c = match(COMMA);
					setState(41);
					((StypeContext)_localctx).i2 = match(ID);
					setState(42);
					((StypeContext)_localctx).s2 = match(SEMIC);
					setState(43);
					((StypeContext)_localctx).st2 = stype();
					_localctx.type += (((StypeContext)_localctx).c!=null?((StypeContext)_localctx).c.getText():null) + "?" + (((StypeContext)_localctx).i2!=null?((StypeContext)_localctx).i2.getText():null) + (((StypeContext)_localctx).s2!=null?((StypeContext)_localctx).s2.getText():null) + (((StypeContext)_localctx).st2.type if not ((StypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(50);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				_localctx.type += "]"
				setState(52);
				match(CRPAR);
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(54);
				((StypeContext)_localctx).r = match(REC);
				setState(55);
				((StypeContext)_localctx).i = match(ID);
				setState(56);
				((StypeContext)_localctx).d = match(DOT);
				setState(57);
				((StypeContext)_localctx).g = guarded();
				_localctx.type = (((StypeContext)_localctx).r!=null?((StypeContext)_localctx).r.getText():null) + " V" + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + " " + (((StypeContext)_localctx).d!=null?((StypeContext)_localctx).d.getText():null) + (((StypeContext)_localctx).g.type if not ((StypeContext)_localctx).g.type == None else "")
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(60);
				((StypeContext)_localctx).i = match(ID);
				_localctx.type = "V" + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null)
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(62);
				((StypeContext)_localctx).e = match(END);
				_localctx.type = (((StypeContext)_localctx).e!=null?((StypeContext)_localctx).e.getText():null)
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(64);
				((StypeContext)_localctx).o = match(OUT);
				setState(65);
				((StypeContext)_localctx).i = match(ID);
				setState(66);
				((StypeContext)_localctx).s = match(SEMIC);
				setState(67);
				((StypeContext)_localctx).st = stype();
				_localctx.type = (((StypeContext)_localctx).o!=null?((StypeContext)_localctx).o.getText():null) + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).s!=null?((StypeContext)_localctx).s.getText():null) + (((StypeContext)_localctx).st.type if not ((StypeContext)_localctx).st.type == None else "") 
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(70);
				((StypeContext)_localctx).e = match(END);
				setState(71);
				((StypeContext)_localctx).prl = match(PRL);
				setState(72);
				((StypeContext)_localctx).spt = sprimetype();
				_localctx.type = (((StypeContext)_localctx).e!=null?((StypeContext)_localctx).e.getText():null) + (((StypeContext)_localctx).prl!=null?((StypeContext)_localctx).prl.getText():null) + (((StypeContext)_localctx).spt!=null?_input.getText(((StypeContext)_localctx).spt.start,((StypeContext)_localctx).spt.stop):null) + (((StypeContext)_localctx).spt.type if not ((StypeContext)_localctx).spt.type == None else "") 
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(75);
				((StypeContext)_localctx).i = match(ID);
				setState(76);
				((StypeContext)_localctx).prl = match(PRL);
				setState(77);
				((StypeContext)_localctx).spt = sprimetype();
				_localctx.type = (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).prl!=null?((StypeContext)_localctx).prl.getText():null) + (((StypeContext)_localctx).spt!=null?_input.getText(((StypeContext)_localctx).spt.start,((StypeContext)_localctx).spt.stop):null) + (((StypeContext)_localctx).spt.type if not ((StypeContext)_localctx).spt.type == None else "") 
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(80);
				((StypeContext)_localctx).sl = match(SLPAR);
				setState(81);
				((StypeContext)_localctx).o = match(OUT);
				setState(82);
				((StypeContext)_localctx).i = match(ID);
				setState(83);
				((StypeContext)_localctx).s = match(SEMIC);
				setState(84);
				((StypeContext)_localctx).st = stype();
				_localctx.type = (((StypeContext)_localctx).sl!=null?((StypeContext)_localctx).sl.getText():null) + (((StypeContext)_localctx).o!=null?((StypeContext)_localctx).o.getText():null) + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).s!=null?((StypeContext)_localctx).s.getText():null) + (((StypeContext)_localctx).st.type if not ((StypeContext)_localctx).st.type == None else "") 
				setState(95);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(86);
					((StypeContext)_localctx).c = match(COMMA);
					setState(87);
					((StypeContext)_localctx).o2 = match(OUT);
					setState(88);
					((StypeContext)_localctx).i2 = match(ID);
					setState(89);
					((StypeContext)_localctx).s2 = match(SEMIC);
					setState(90);
					((StypeContext)_localctx).st2 = stype();
					_localctx.type += (((StypeContext)_localctx).c!=null?((StypeContext)_localctx).c.getText():null) + (((StypeContext)_localctx).o2!=null?((StypeContext)_localctx).o2.getText():null) + (((StypeContext)_localctx).i2!=null?((StypeContext)_localctx).i2.getText():null) + (((StypeContext)_localctx).s2!=null?((StypeContext)_localctx).s2.getText():null) + (((StypeContext)_localctx).st2.type if not ((StypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(97);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(98);
				((StypeContext)_localctx).sr = match(SRPAR);
				_localctx.type += (((StypeContext)_localctx).sr!=null?((StypeContext)_localctx).sr.getText():null)
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(101);
				((StypeContext)_localctx).n = match(IN);
				setState(102);
				((StypeContext)_localctx).i = match(ID);
				setState(103);
				((StypeContext)_localctx).s = match(SEMIC);
				setState(104);
				((StypeContext)_localctx).st = stype();
				_localctx.type = (((StypeContext)_localctx).n!=null?((StypeContext)_localctx).n.getText():null) + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).s!=null?((StypeContext)_localctx).s.getText():null) + (((StypeContext)_localctx).st.type if not ((StypeContext)_localctx).st.type == None else "") 
				}
				break;
			case 11:
				enterOuterAlt(_localctx, 11);
				{
				setState(107);
				((StypeContext)_localctx).sl = match(SLPAR);
				setState(108);
				((StypeContext)_localctx).n = match(IN);
				setState(109);
				((StypeContext)_localctx).i = match(ID);
				setState(110);
				((StypeContext)_localctx).s = match(SEMIC);
				setState(111);
				((StypeContext)_localctx).st = stype();
				_localctx.type = (((StypeContext)_localctx).sl!=null?((StypeContext)_localctx).sl.getText():null) + (((StypeContext)_localctx).n!=null?((StypeContext)_localctx).n.getText():null) + (((StypeContext)_localctx).i!=null?((StypeContext)_localctx).i.getText():null) + (((StypeContext)_localctx).s!=null?((StypeContext)_localctx).s.getText():null) + (((StypeContext)_localctx).st.type if not ((StypeContext)_localctx).st.type == None else "") 
				setState(122);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(113);
					((StypeContext)_localctx).c = match(COMMA);
					setState(114);
					((StypeContext)_localctx).n2 = match(IN);
					setState(115);
					((StypeContext)_localctx).i2 = match(ID);
					setState(116);
					((StypeContext)_localctx).s2 = match(SEMIC);
					setState(117);
					((StypeContext)_localctx).st2 = stype();
					_localctx.type += (((StypeContext)_localctx).c!=null?((StypeContext)_localctx).c.getText():null) + (((StypeContext)_localctx).n2!=null?((StypeContext)_localctx).n2.getText():null) + (((StypeContext)_localctx).i2!=null?((StypeContext)_localctx).i2.getText():null) + (((StypeContext)_localctx).s2!=null?((StypeContext)_localctx).s2.getText():null) + (((StypeContext)_localctx).st2.type if not ((StypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(124);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(125);
				((StypeContext)_localctx).sr = match(SRPAR);
				_localctx.type += (((StypeContext)_localctx).sr!=null?((StypeContext)_localctx).sr.getText():null)
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SprimetypeContext extends ParserRuleContext {
		public  type;
		public Token i;
		public Token s;
		public SprimetypeContext st;
		public Token c;
		public Token i2;
		public Token s2;
		public SprimetypeContext st2;
		public Token r;
		public Token d;
		public GuardedContext g;
		public Token e;
		public Token o;
		public Token prl;
		public SprimetypeContext spt;
		public Token sl;
		public Token o2;
		public Token sr;
		public Token n;
		public Token n2;
		public TerminalNode PLUS() { return getToken(SessionTypeParser.PLUS, 0); }
		public TerminalNode CLPAR() { return getToken(SessionTypeParser.CLPAR, 0); }
		public TerminalNode CRPAR() { return getToken(SessionTypeParser.CRPAR, 0); }
		public List<TerminalNode> ID() { return getTokens(SessionTypeParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(SessionTypeParser.ID, i);
		}
		public List<TerminalNode> SEMIC() { return getTokens(SessionTypeParser.SEMIC); }
		public TerminalNode SEMIC(int i) {
			return getToken(SessionTypeParser.SEMIC, i);
		}
		public List<SprimetypeContext> sprimetype() {
			return getRuleContexts(SprimetypeContext.class);
		}
		public SprimetypeContext sprimetype(int i) {
			return getRuleContext(SprimetypeContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(SessionTypeParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(SessionTypeParser.COMMA, i);
		}
		public TerminalNode AND() { return getToken(SessionTypeParser.AND, 0); }
		public TerminalNode REC() { return getToken(SessionTypeParser.REC, 0); }
		public TerminalNode DOT() { return getToken(SessionTypeParser.DOT, 0); }
		public GuardedContext guarded() {
			return getRuleContext(GuardedContext.class,0);
		}
		public TerminalNode END() { return getToken(SessionTypeParser.END, 0); }
		public List<TerminalNode> OUT() { return getTokens(SessionTypeParser.OUT); }
		public TerminalNode OUT(int i) {
			return getToken(SessionTypeParser.OUT, i);
		}
		public TerminalNode PRL() { return getToken(SessionTypeParser.PRL, 0); }
		public TerminalNode SLPAR() { return getToken(SessionTypeParser.SLPAR, 0); }
		public TerminalNode SRPAR() { return getToken(SessionTypeParser.SRPAR, 0); }
		public List<TerminalNode> IN() { return getTokens(SessionTypeParser.IN); }
		public TerminalNode IN(int i) {
			return getToken(SessionTypeParser.IN, i);
		}
		public SprimetypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_sprimetype; }
	}

	public final SprimetypeContext sprimetype() throws RecognitionException {
		SprimetypeContext _localctx = new SprimetypeContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_sprimetype);
		int _la;
		try {
			setState(246);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,9,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(130);
				match(PLUS);
				setState(131);
				match(CLPAR);
				_localctx.type = "["
				setState(133);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(134);
				((SprimetypeContext)_localctx).s = match(SEMIC);
				setState(135);
				((SprimetypeContext)_localctx).st = sprimetype();
				_localctx.type += "!" + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).s!=null?((SprimetypeContext)_localctx).s.getText():null) + (((SprimetypeContext)_localctx).st.type if not ((SprimetypeContext)_localctx).st.type == None else "") 
				setState(145);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(137);
					((SprimetypeContext)_localctx).c = match(COMMA);
					setState(138);
					((SprimetypeContext)_localctx).i2 = match(ID);
					setState(139);
					((SprimetypeContext)_localctx).s2 = match(SEMIC);
					setState(140);
					((SprimetypeContext)_localctx).st2 = sprimetype();
					_localctx.type += (((SprimetypeContext)_localctx).c!=null?((SprimetypeContext)_localctx).c.getText():null) + "!" + (((SprimetypeContext)_localctx).i2!=null?((SprimetypeContext)_localctx).i2.getText():null) + (((SprimetypeContext)_localctx).s2!=null?((SprimetypeContext)_localctx).s2.getText():null) + (((SprimetypeContext)_localctx).st2.type if not ((SprimetypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(147);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				_localctx.type += "]"
				setState(149);
				match(CRPAR);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(151);
				match(AND);
				setState(152);
				match(CLPAR);
				_localctx.type = "["
				setState(154);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(155);
				((SprimetypeContext)_localctx).s = match(SEMIC);
				setState(156);
				((SprimetypeContext)_localctx).st = sprimetype();
				_localctx.type += "?" + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).s!=null?((SprimetypeContext)_localctx).s.getText():null) + (((SprimetypeContext)_localctx).st.type if not ((SprimetypeContext)_localctx).st.type == None else "") 
				setState(166);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(158);
					((SprimetypeContext)_localctx).c = match(COMMA);
					setState(159);
					((SprimetypeContext)_localctx).i2 = match(ID);
					setState(160);
					((SprimetypeContext)_localctx).s2 = match(SEMIC);
					setState(161);
					((SprimetypeContext)_localctx).st2 = sprimetype();
					_localctx.type += (((SprimetypeContext)_localctx).c!=null?((SprimetypeContext)_localctx).c.getText():null) + "?" + (((SprimetypeContext)_localctx).i2!=null?((SprimetypeContext)_localctx).i2.getText():null) + (((SprimetypeContext)_localctx).s2!=null?((SprimetypeContext)_localctx).s2.getText():null) + (((SprimetypeContext)_localctx).st2.type if not ((SprimetypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(168);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				_localctx.type += "]"
				setState(170);
				match(CRPAR);
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(172);
				((SprimetypeContext)_localctx).r = match(REC);
				setState(173);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(174);
				((SprimetypeContext)_localctx).d = match(DOT);
				setState(175);
				((SprimetypeContext)_localctx).g = guarded();
				_localctx.type = (((SprimetypeContext)_localctx).r!=null?((SprimetypeContext)_localctx).r.getText():null) + " V" + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + " " + (((SprimetypeContext)_localctx).d!=null?((SprimetypeContext)_localctx).d.getText():null) + (((SprimetypeContext)_localctx).g.type if not ((SprimetypeContext)_localctx).g.type == None else "")
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(178);
				((SprimetypeContext)_localctx).i = match(ID);
				_localctx.type = "V" + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null)
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(180);
				((SprimetypeContext)_localctx).e = match(END);
				_localctx.type = (((SprimetypeContext)_localctx).e!=null?((SprimetypeContext)_localctx).e.getText():null)
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(182);
				((SprimetypeContext)_localctx).o = match(OUT);
				setState(183);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(184);
				((SprimetypeContext)_localctx).s = match(SEMIC);
				setState(185);
				((SprimetypeContext)_localctx).st = sprimetype();
				_localctx.type = (((SprimetypeContext)_localctx).o!=null?((SprimetypeContext)_localctx).o.getText():null) + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).s!=null?((SprimetypeContext)_localctx).s.getText():null) + (((SprimetypeContext)_localctx).st.type if not ((SprimetypeContext)_localctx).st.type == None else "") 
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(188);
				((SprimetypeContext)_localctx).e = match(END);
				setState(189);
				((SprimetypeContext)_localctx).prl = match(PRL);
				setState(190);
				((SprimetypeContext)_localctx).spt = sprimetype();
				_localctx.type = (((SprimetypeContext)_localctx).e!=null?((SprimetypeContext)_localctx).e.getText():null) + (((SprimetypeContext)_localctx).prl!=null?((SprimetypeContext)_localctx).prl.getText():null) + (((SprimetypeContext)_localctx).spt!=null?_input.getText(((SprimetypeContext)_localctx).spt.start,((SprimetypeContext)_localctx).spt.stop):null) + (((SprimetypeContext)_localctx).spt.type if not ((SprimetypeContext)_localctx).spt.type == None else "") 
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(193);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(194);
				((SprimetypeContext)_localctx).prl = match(PRL);
				setState(195);
				((SprimetypeContext)_localctx).spt = sprimetype();
				_localctx.type = (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).prl!=null?((SprimetypeContext)_localctx).prl.getText():null) + (((SprimetypeContext)_localctx).spt!=null?_input.getText(((SprimetypeContext)_localctx).spt.start,((SprimetypeContext)_localctx).spt.stop):null) + (((SprimetypeContext)_localctx).spt.type if not ((SprimetypeContext)_localctx).spt.type == None else "") 
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(198);
				((SprimetypeContext)_localctx).sl = match(SLPAR);
				setState(199);
				((SprimetypeContext)_localctx).o = match(OUT);
				setState(200);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(201);
				((SprimetypeContext)_localctx).s = match(SEMIC);
				setState(202);
				((SprimetypeContext)_localctx).st = sprimetype();
				_localctx.type = (((SprimetypeContext)_localctx).sl!=null?((SprimetypeContext)_localctx).sl.getText():null) + (((SprimetypeContext)_localctx).o!=null?((SprimetypeContext)_localctx).o.getText():null) + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).s!=null?((SprimetypeContext)_localctx).s.getText():null) + (((SprimetypeContext)_localctx).st.type if not ((SprimetypeContext)_localctx).st.type == None else "") 
				setState(213);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(204);
					((SprimetypeContext)_localctx).c = match(COMMA);
					setState(205);
					((SprimetypeContext)_localctx).o2 = match(OUT);
					setState(206);
					((SprimetypeContext)_localctx).i2 = match(ID);
					setState(207);
					((SprimetypeContext)_localctx).s2 = match(SEMIC);
					setState(208);
					((SprimetypeContext)_localctx).st2 = sprimetype();
					_localctx.type += (((SprimetypeContext)_localctx).c!=null?((SprimetypeContext)_localctx).c.getText():null) + (((SprimetypeContext)_localctx).o2!=null?((SprimetypeContext)_localctx).o2.getText():null) + (((SprimetypeContext)_localctx).i2!=null?((SprimetypeContext)_localctx).i2.getText():null) + (((SprimetypeContext)_localctx).s2!=null?((SprimetypeContext)_localctx).s2.getText():null) + (((SprimetypeContext)_localctx).st2.type if not ((SprimetypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(215);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(216);
				((SprimetypeContext)_localctx).sr = match(SRPAR);
				_localctx.type += (((SprimetypeContext)_localctx).sr!=null?((SprimetypeContext)_localctx).sr.getText():null)
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(219);
				((SprimetypeContext)_localctx).n = match(IN);
				setState(220);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(221);
				((SprimetypeContext)_localctx).s = match(SEMIC);
				setState(222);
				((SprimetypeContext)_localctx).st = sprimetype();
				_localctx.type = (((SprimetypeContext)_localctx).n!=null?((SprimetypeContext)_localctx).n.getText():null) + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).s!=null?((SprimetypeContext)_localctx).s.getText():null) + (((SprimetypeContext)_localctx).st.type if not ((SprimetypeContext)_localctx).st.type == None else "") 
				}
				break;
			case 11:
				enterOuterAlt(_localctx, 11);
				{
				setState(225);
				((SprimetypeContext)_localctx).sl = match(SLPAR);
				setState(226);
				((SprimetypeContext)_localctx).n = match(IN);
				setState(227);
				((SprimetypeContext)_localctx).i = match(ID);
				setState(228);
				((SprimetypeContext)_localctx).s = match(SEMIC);
				setState(229);
				((SprimetypeContext)_localctx).st = sprimetype();
				_localctx.type = (((SprimetypeContext)_localctx).sl!=null?((SprimetypeContext)_localctx).sl.getText():null) + (((SprimetypeContext)_localctx).n!=null?((SprimetypeContext)_localctx).n.getText():null) + (((SprimetypeContext)_localctx).i!=null?((SprimetypeContext)_localctx).i.getText():null) + (((SprimetypeContext)_localctx).s!=null?((SprimetypeContext)_localctx).s.getText():null) + (((SprimetypeContext)_localctx).st.type if not ((SprimetypeContext)_localctx).st.type == None else "") 
				setState(240);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(231);
					((SprimetypeContext)_localctx).c = match(COMMA);
					setState(232);
					((SprimetypeContext)_localctx).n2 = match(IN);
					setState(233);
					((SprimetypeContext)_localctx).i2 = match(ID);
					setState(234);
					((SprimetypeContext)_localctx).s2 = match(SEMIC);
					setState(235);
					((SprimetypeContext)_localctx).st2 = sprimetype();
					_localctx.type += (((SprimetypeContext)_localctx).c!=null?((SprimetypeContext)_localctx).c.getText():null) + (((SprimetypeContext)_localctx).n2!=null?((SprimetypeContext)_localctx).n2.getText():null) + (((SprimetypeContext)_localctx).i2!=null?((SprimetypeContext)_localctx).i2.getText():null) + (((SprimetypeContext)_localctx).s2!=null?((SprimetypeContext)_localctx).s2.getText():null) + (((SprimetypeContext)_localctx).st2.type if not ((SprimetypeContext)_localctx).st2.type == None else "")
					}
					}
					setState(242);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(243);
				((SprimetypeContext)_localctx).sr = match(SRPAR);
				_localctx.type += (((SprimetypeContext)_localctx).sr!=null?((SprimetypeContext)_localctx).sr.getText():null)
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class GuardedContext extends ParserRuleContext {
		public  type;
		public Token i;
		public Token s;
		public StypeContext st;
		public Token c;
		public Token i2;
		public Token s2;
		public StypeContext st2;
		public Token r;
		public Token d;
		public GuardedContext g;
		public Token e;
		public Token o;
		public Token sl;
		public Token o2;
		public Token sr;
		public Token n;
		public Token n2;
		public TerminalNode PLUS() { return getToken(SessionTypeParser.PLUS, 0); }
		public TerminalNode CLPAR() { return getToken(SessionTypeParser.CLPAR, 0); }
		public TerminalNode CRPAR() { return getToken(SessionTypeParser.CRPAR, 0); }
		public List<TerminalNode> ID() { return getTokens(SessionTypeParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(SessionTypeParser.ID, i);
		}
		public List<TerminalNode> SEMIC() { return getTokens(SessionTypeParser.SEMIC); }
		public TerminalNode SEMIC(int i) {
			return getToken(SessionTypeParser.SEMIC, i);
		}
		public List<StypeContext> stype() {
			return getRuleContexts(StypeContext.class);
		}
		public StypeContext stype(int i) {
			return getRuleContext(StypeContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(SessionTypeParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(SessionTypeParser.COMMA, i);
		}
		public TerminalNode AND() { return getToken(SessionTypeParser.AND, 0); }
		public TerminalNode REC() { return getToken(SessionTypeParser.REC, 0); }
		public TerminalNode DOT() { return getToken(SessionTypeParser.DOT, 0); }
		public GuardedContext guarded() {
			return getRuleContext(GuardedContext.class,0);
		}
		public TerminalNode END() { return getToken(SessionTypeParser.END, 0); }
		public List<TerminalNode> OUT() { return getTokens(SessionTypeParser.OUT); }
		public TerminalNode OUT(int i) {
			return getToken(SessionTypeParser.OUT, i);
		}
		public TerminalNode SLPAR() { return getToken(SessionTypeParser.SLPAR, 0); }
		public TerminalNode SRPAR() { return getToken(SessionTypeParser.SRPAR, 0); }
		public List<TerminalNode> IN() { return getTokens(SessionTypeParser.IN); }
		public TerminalNode IN(int i) {
			return getToken(SessionTypeParser.IN, i);
		}
		public GuardedContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_guarded; }
	}

	public final GuardedContext guarded() throws RecognitionException {
		GuardedContext _localctx = new GuardedContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_guarded);
		int _la;
		try {
			setState(352);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(248);
				match(PLUS);
				setState(249);
				match(CLPAR);
				_localctx.type = "["
				setState(251);
				((GuardedContext)_localctx).i = match(ID);
				setState(252);
				((GuardedContext)_localctx).s = match(SEMIC);
				setState(253);
				((GuardedContext)_localctx).st = stype();
				_localctx.type += "!" + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + (((GuardedContext)_localctx).s!=null?((GuardedContext)_localctx).s.getText():null) + (((GuardedContext)_localctx).st.type if not ((GuardedContext)_localctx).st.type == None else "") 
				setState(263);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(255);
					((GuardedContext)_localctx).c = match(COMMA);
					setState(256);
					((GuardedContext)_localctx).i2 = match(ID);
					setState(257);
					((GuardedContext)_localctx).s2 = match(SEMIC);
					setState(258);
					((GuardedContext)_localctx).st2 = stype();
					_localctx.type += (((GuardedContext)_localctx).c!=null?((GuardedContext)_localctx).c.getText():null) + "!" + (((GuardedContext)_localctx).i2!=null?((GuardedContext)_localctx).i2.getText():null) + (((GuardedContext)_localctx).s2!=null?((GuardedContext)_localctx).s2.getText():null) + (((GuardedContext)_localctx).st2.type if not ((GuardedContext)_localctx).st2.type == None else "")
					}
					}
					setState(265);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				_localctx.type += "]"
				setState(267);
				match(CRPAR);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(269);
				match(AND);
				setState(270);
				match(CLPAR);
				_localctx.type = "["
				setState(272);
				((GuardedContext)_localctx).i = match(ID);
				setState(273);
				((GuardedContext)_localctx).s = match(SEMIC);
				setState(274);
				((GuardedContext)_localctx).st = stype();
				_localctx.type += "?" + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + (((GuardedContext)_localctx).s!=null?((GuardedContext)_localctx).s.getText():null) + (((GuardedContext)_localctx).st.type if not ((GuardedContext)_localctx).st.type == None else "") 
				setState(284);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(276);
					((GuardedContext)_localctx).c = match(COMMA);
					setState(277);
					((GuardedContext)_localctx).i2 = match(ID);
					setState(278);
					((GuardedContext)_localctx).s2 = match(SEMIC);
					setState(279);
					((GuardedContext)_localctx).st2 = stype();
					_localctx.type += (((GuardedContext)_localctx).c!=null?((GuardedContext)_localctx).c.getText():null) + "?" + (((GuardedContext)_localctx).i2!=null?((GuardedContext)_localctx).i2.getText():null) + (((GuardedContext)_localctx).s2!=null?((GuardedContext)_localctx).s2.getText():null) + (((GuardedContext)_localctx).st2.type if not ((GuardedContext)_localctx).st2.type == None else "")
					}
					}
					setState(286);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				_localctx.type += "]"
				setState(288);
				match(CRPAR);
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(290);
				((GuardedContext)_localctx).r = match(REC);
				setState(291);
				((GuardedContext)_localctx).i = match(ID);
				setState(292);
				((GuardedContext)_localctx).d = match(DOT);
				setState(293);
				((GuardedContext)_localctx).g = guarded();
				_localctx.type = (((GuardedContext)_localctx).r!=null?((GuardedContext)_localctx).r.getText():null) + " V" + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + " " + (((GuardedContext)_localctx).d!=null?((GuardedContext)_localctx).d.getText():null) + (((GuardedContext)_localctx).g.type if not ((GuardedContext)_localctx).g.type == None else "")
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(296);
				((GuardedContext)_localctx).e = match(END);
				_localctx.type = (((GuardedContext)_localctx).e!=null?((GuardedContext)_localctx).e.getText():null)
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(298);
				((GuardedContext)_localctx).o = match(OUT);
				setState(299);
				((GuardedContext)_localctx).i = match(ID);
				setState(300);
				((GuardedContext)_localctx).s = match(SEMIC);
				setState(301);
				((GuardedContext)_localctx).st = stype();
				_localctx.type = (((GuardedContext)_localctx).o!=null?((GuardedContext)_localctx).o.getText():null) + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + (((GuardedContext)_localctx).s!=null?((GuardedContext)_localctx).s.getText():null) + (((GuardedContext)_localctx).st.type if not ((GuardedContext)_localctx).st.type == None else "") 
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(304);
				((GuardedContext)_localctx).sl = match(SLPAR);
				setState(305);
				((GuardedContext)_localctx).o = match(OUT);
				setState(306);
				((GuardedContext)_localctx).i = match(ID);
				setState(307);
				((GuardedContext)_localctx).s = match(SEMIC);
				setState(308);
				((GuardedContext)_localctx).st = stype();
				_localctx.type = (((GuardedContext)_localctx).sl!=null?((GuardedContext)_localctx).sl.getText():null) + (((GuardedContext)_localctx).o!=null?((GuardedContext)_localctx).o.getText():null) + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + (((GuardedContext)_localctx).s!=null?((GuardedContext)_localctx).s.getText():null) + (((GuardedContext)_localctx).st.type if not ((GuardedContext)_localctx).st.type == None else "") 
				setState(319);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(310);
					((GuardedContext)_localctx).c = match(COMMA);
					setState(311);
					((GuardedContext)_localctx).o2 = match(OUT);
					setState(312);
					((GuardedContext)_localctx).i2 = match(ID);
					setState(313);
					((GuardedContext)_localctx).s2 = match(SEMIC);
					setState(314);
					((GuardedContext)_localctx).st2 = stype();
					_localctx.type += (((GuardedContext)_localctx).c!=null?((GuardedContext)_localctx).c.getText():null) + (((GuardedContext)_localctx).o2!=null?((GuardedContext)_localctx).o2.getText():null) + (((GuardedContext)_localctx).i2!=null?((GuardedContext)_localctx).i2.getText():null) + (((GuardedContext)_localctx).s2!=null?((GuardedContext)_localctx).s2.getText():null) + (((GuardedContext)_localctx).st2.type if not ((GuardedContext)_localctx).st2.type == None else "")
					}
					}
					setState(321);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(322);
				((GuardedContext)_localctx).sr = match(SRPAR);
				_localctx.type += (((GuardedContext)_localctx).sr!=null?((GuardedContext)_localctx).sr.getText():null)
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(325);
				((GuardedContext)_localctx).n = match(IN);
				setState(326);
				((GuardedContext)_localctx).i = match(ID);
				setState(327);
				((GuardedContext)_localctx).s = match(SEMIC);
				setState(328);
				((GuardedContext)_localctx).st = stype();
				_localctx.type = (((GuardedContext)_localctx).n!=null?((GuardedContext)_localctx).n.getText():null) + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + (((GuardedContext)_localctx).s!=null?((GuardedContext)_localctx).s.getText():null) + (((GuardedContext)_localctx).st.type if not ((GuardedContext)_localctx).st.type == None else "") 
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(331);
				((GuardedContext)_localctx).sl = match(SLPAR);
				setState(332);
				((GuardedContext)_localctx).n = match(IN);
				setState(333);
				((GuardedContext)_localctx).i = match(ID);
				setState(334);
				((GuardedContext)_localctx).s = match(SEMIC);
				setState(335);
				((GuardedContext)_localctx).st = stype();
				_localctx.type = (((GuardedContext)_localctx).sl!=null?((GuardedContext)_localctx).sl.getText():null) + (((GuardedContext)_localctx).n!=null?((GuardedContext)_localctx).n.getText():null) + (((GuardedContext)_localctx).i!=null?((GuardedContext)_localctx).i.getText():null) + (((GuardedContext)_localctx).s!=null?((GuardedContext)_localctx).s.getText():null) + (((GuardedContext)_localctx).st.type if not ((GuardedContext)_localctx).st.type == None else "") 
				setState(346);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(337);
					((GuardedContext)_localctx).c = match(COMMA);
					setState(338);
					((GuardedContext)_localctx).n2 = match(IN);
					setState(339);
					((GuardedContext)_localctx).i2 = match(ID);
					setState(340);
					((GuardedContext)_localctx).s2 = match(SEMIC);
					setState(341);
					((GuardedContext)_localctx).st2 = stype();
					_localctx.type += (((GuardedContext)_localctx).c!=null?((GuardedContext)_localctx).c.getText():null) + (((GuardedContext)_localctx).n2!=null?((GuardedContext)_localctx).n2.getText():null) + (((GuardedContext)_localctx).i2!=null?((GuardedContext)_localctx).i2.getText():null) + (((GuardedContext)_localctx).s2!=null?((GuardedContext)_localctx).s2.getText():null) + (((GuardedContext)_localctx).st2.type if not ((GuardedContext)_localctx).st2.type == None else "")
					}
					}
					setState(348);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(349);
				((GuardedContext)_localctx).sr = match(SRPAR);
				_localctx.type += (((GuardedContext)_localctx).sr!=null?((GuardedContext)_localctx).sr.getText():null)
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\22\u0165\4\2\t\2"+
		"\4\3\t\3\4\4\t\4\4\5\t\5\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\7\3\34\n\3\f\3\16\3\37\13\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\7\3\61\n\3\f\3\16\3\64\13"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\7\3`\n\3\f\3\16\3c\13\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\7\3{\n\3\f\3\16\3~\13\3\3\3\3\3\3\3\5\3\u0083\n\3\3\4\3\4\3\4\3\4\3"+
		"\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\7\4\u0092\n\4\f\4\16\4\u0095\13\4\3"+
		"\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\7\4\u00a7"+
		"\n\4\f\4\16\4\u00aa\13\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4"+
		"\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\7\4\u00d6\n\4\f\4"+
		"\16\4\u00d9\13\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\7\4\u00f1\n\4\f\4\16\4\u00f4\13\4\3"+
		"\4\3\4\3\4\5\4\u00f9\n\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\7\5\u0108\n\5\f\5\16\5\u010b\13\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\7\5\u011d\n\5\f\5\16\5\u0120\13\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\7\5\u0140\n\5\f\5\16"+
		"\5\u0143\13\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\7\5\u015b\n\5\f\5\16\5\u015e\13\5\3\5"+
		"\3\5\3\5\5\5\u0163\n\5\3\5\2\2\6\2\4\6\b\2\2\2\u0187\2\n\3\2\2\2\4\u0082"+
		"\3\2\2\2\6\u00f8\3\2\2\2\b\u0162\3\2\2\2\n\13\5\4\3\2\13\f\b\2\1\2\f\r"+
		"\7\2\2\3\r\3\3\2\2\2\16\17\7\3\2\2\17\20\7\4\2\2\20\21\b\3\1\2\21\22\7"+
		"\20\2\2\22\23\7\b\2\2\23\24\5\4\3\2\24\35\b\3\1\2\25\26\7\t\2\2\26\27"+
		"\7\20\2\2\27\30\7\b\2\2\30\31\5\4\3\2\31\32\b\3\1\2\32\34\3\2\2\2\33\25"+
		"\3\2\2\2\34\37\3\2\2\2\35\33\3\2\2\2\35\36\3\2\2\2\36 \3\2\2\2\37\35\3"+
		"\2\2\2 !\b\3\1\2!\"\7\5\2\2\"\u0083\3\2\2\2#$\7\13\2\2$%\7\4\2\2%&\b\3"+
		"\1\2&\'\7\20\2\2\'(\7\b\2\2()\5\4\3\2)\62\b\3\1\2*+\7\t\2\2+,\7\20\2\2"+
		",-\7\b\2\2-.\5\4\3\2./\b\3\1\2/\61\3\2\2\2\60*\3\2\2\2\61\64\3\2\2\2\62"+
		"\60\3\2\2\2\62\63\3\2\2\2\63\65\3\2\2\2\64\62\3\2\2\2\65\66\b\3\1\2\66"+
		"\67\7\5\2\2\67\u0083\3\2\2\289\7\f\2\29:\7\20\2\2:;\7\n\2\2;<\5\b\5\2"+
		"<=\b\3\1\2=\u0083\3\2\2\2>?\7\20\2\2?\u0083\b\3\1\2@A\7\r\2\2A\u0083\b"+
		"\3\1\2BC\7\16\2\2CD\7\20\2\2DE\7\b\2\2EF\5\4\3\2FG\b\3\1\2G\u0083\3\2"+
		"\2\2HI\7\r\2\2IJ\7\21\2\2JK\5\6\4\2KL\b\3\1\2L\u0083\3\2\2\2MN\7\20\2"+
		"\2NO\7\21\2\2OP\5\6\4\2PQ\b\3\1\2Q\u0083\3\2\2\2RS\7\6\2\2ST\7\16\2\2"+
		"TU\7\20\2\2UV\7\b\2\2VW\5\4\3\2Wa\b\3\1\2XY\7\t\2\2YZ\7\16\2\2Z[\7\20"+
		"\2\2[\\\7\b\2\2\\]\5\4\3\2]^\b\3\1\2^`\3\2\2\2_X\3\2\2\2`c\3\2\2\2a_\3"+
		"\2\2\2ab\3\2\2\2bd\3\2\2\2ca\3\2\2\2de\7\7\2\2ef\b\3\1\2f\u0083\3\2\2"+
		"\2gh\7\17\2\2hi\7\20\2\2ij\7\b\2\2jk\5\4\3\2kl\b\3\1\2l\u0083\3\2\2\2"+
		"mn\7\6\2\2no\7\17\2\2op\7\20\2\2pq\7\b\2\2qr\5\4\3\2r|\b\3\1\2st\7\t\2"+
		"\2tu\7\17\2\2uv\7\20\2\2vw\7\b\2\2wx\5\4\3\2xy\b\3\1\2y{\3\2\2\2zs\3\2"+
		"\2\2{~\3\2\2\2|z\3\2\2\2|}\3\2\2\2}\177\3\2\2\2~|\3\2\2\2\177\u0080\7"+
		"\7\2\2\u0080\u0081\b\3\1\2\u0081\u0083\3\2\2\2\u0082\16\3\2\2\2\u0082"+
		"#\3\2\2\2\u00828\3\2\2\2\u0082>\3\2\2\2\u0082@\3\2\2\2\u0082B\3\2\2\2"+
		"\u0082H\3\2\2\2\u0082M\3\2\2\2\u0082R\3\2\2\2\u0082g\3\2\2\2\u0082m\3"+
		"\2\2\2\u0083\5\3\2\2\2\u0084\u0085\7\3\2\2\u0085\u0086\7\4\2\2\u0086\u0087"+
		"\b\4\1\2\u0087\u0088\7\20\2\2\u0088\u0089\7\b\2\2\u0089\u008a\5\6\4\2"+
		"\u008a\u0093\b\4\1\2\u008b\u008c\7\t\2\2\u008c\u008d\7\20\2\2\u008d\u008e"+
		"\7\b\2\2\u008e\u008f\5\6\4\2\u008f\u0090\b\4\1\2\u0090\u0092\3\2\2\2\u0091"+
		"\u008b\3\2\2\2\u0092\u0095\3\2\2\2\u0093\u0091\3\2\2\2\u0093\u0094\3\2"+
		"\2\2\u0094\u0096\3\2\2\2\u0095\u0093\3\2\2\2\u0096\u0097\b\4\1\2\u0097"+
		"\u0098\7\5\2\2\u0098\u00f9\3\2\2\2\u0099\u009a\7\13\2\2\u009a\u009b\7"+
		"\4\2\2\u009b\u009c\b\4\1\2\u009c\u009d\7\20\2\2\u009d\u009e\7\b\2\2\u009e"+
		"\u009f\5\6\4\2\u009f\u00a8\b\4\1\2\u00a0\u00a1\7\t\2\2\u00a1\u00a2\7\20"+
		"\2\2\u00a2\u00a3\7\b\2\2\u00a3\u00a4\5\6\4\2\u00a4\u00a5\b\4\1\2\u00a5"+
		"\u00a7\3\2\2\2\u00a6\u00a0\3\2\2\2\u00a7\u00aa\3\2\2\2\u00a8\u00a6\3\2"+
		"\2\2\u00a8\u00a9\3\2\2\2\u00a9\u00ab\3\2\2\2\u00aa\u00a8\3\2\2\2\u00ab"+
		"\u00ac\b\4\1\2\u00ac\u00ad\7\5\2\2\u00ad\u00f9\3\2\2\2\u00ae\u00af\7\f"+
		"\2\2\u00af\u00b0\7\20\2\2\u00b0\u00b1\7\n\2\2\u00b1\u00b2\5\b\5\2\u00b2"+
		"\u00b3\b\4\1\2\u00b3\u00f9\3\2\2\2\u00b4\u00b5\7\20\2\2\u00b5\u00f9\b"+
		"\4\1\2\u00b6\u00b7\7\r\2\2\u00b7\u00f9\b\4\1\2\u00b8\u00b9\7\16\2\2\u00b9"+
		"\u00ba\7\20\2\2\u00ba\u00bb\7\b\2\2\u00bb\u00bc\5\6\4\2\u00bc\u00bd\b"+
		"\4\1\2\u00bd\u00f9\3\2\2\2\u00be\u00bf\7\r\2\2\u00bf\u00c0\7\21\2\2\u00c0"+
		"\u00c1\5\6\4\2\u00c1\u00c2\b\4\1\2\u00c2\u00f9\3\2\2\2\u00c3\u00c4\7\20"+
		"\2\2\u00c4\u00c5\7\21\2\2\u00c5\u00c6\5\6\4\2\u00c6\u00c7\b\4\1\2\u00c7"+
		"\u00f9\3\2\2\2\u00c8\u00c9\7\6\2\2\u00c9\u00ca\7\16\2\2\u00ca\u00cb\7"+
		"\20\2\2\u00cb\u00cc\7\b\2\2\u00cc\u00cd\5\6\4\2\u00cd\u00d7\b\4\1\2\u00ce"+
		"\u00cf\7\t\2\2\u00cf\u00d0\7\16\2\2\u00d0\u00d1\7\20\2\2\u00d1\u00d2\7"+
		"\b\2\2\u00d2\u00d3\5\6\4\2\u00d3\u00d4\b\4\1\2\u00d4\u00d6\3\2\2\2\u00d5"+
		"\u00ce\3\2\2\2\u00d6\u00d9\3\2\2\2\u00d7\u00d5\3\2\2\2\u00d7\u00d8\3\2"+
		"\2\2\u00d8\u00da\3\2\2\2\u00d9\u00d7\3\2\2\2\u00da\u00db\7\7\2\2\u00db"+
		"\u00dc\b\4\1\2\u00dc\u00f9\3\2\2\2\u00dd\u00de\7\17\2\2\u00de\u00df\7"+
		"\20\2\2\u00df\u00e0\7\b\2\2\u00e0\u00e1\5\6\4\2\u00e1\u00e2\b\4\1\2\u00e2"+
		"\u00f9\3\2\2\2\u00e3\u00e4\7\6\2\2\u00e4\u00e5\7\17\2\2\u00e5\u00e6\7"+
		"\20\2\2\u00e6\u00e7\7\b\2\2\u00e7\u00e8\5\6\4\2\u00e8\u00f2\b\4\1\2\u00e9"+
		"\u00ea\7\t\2\2\u00ea\u00eb\7\17\2\2\u00eb\u00ec\7\20\2\2\u00ec\u00ed\7"+
		"\b\2\2\u00ed\u00ee\5\6\4\2\u00ee\u00ef\b\4\1\2\u00ef\u00f1\3\2\2\2\u00f0"+
		"\u00e9\3\2\2\2\u00f1\u00f4\3\2\2\2\u00f2\u00f0\3\2\2\2\u00f2\u00f3\3\2"+
		"\2\2\u00f3\u00f5\3\2\2\2\u00f4\u00f2\3\2\2\2\u00f5\u00f6\7\7\2\2\u00f6"+
		"\u00f7\b\4\1\2\u00f7\u00f9\3\2\2\2\u00f8\u0084\3\2\2\2\u00f8\u0099\3\2"+
		"\2\2\u00f8\u00ae\3\2\2\2\u00f8\u00b4\3\2\2\2\u00f8\u00b6\3\2\2\2\u00f8"+
		"\u00b8\3\2\2\2\u00f8\u00be\3\2\2\2\u00f8\u00c3\3\2\2\2\u00f8\u00c8\3\2"+
		"\2\2\u00f8\u00dd\3\2\2\2\u00f8\u00e3\3\2\2\2\u00f9\7\3\2\2\2\u00fa\u00fb"+
		"\7\3\2\2\u00fb\u00fc\7\4\2\2\u00fc\u00fd\b\5\1\2\u00fd\u00fe\7\20\2\2"+
		"\u00fe\u00ff\7\b\2\2\u00ff\u0100\5\4\3\2\u0100\u0109\b\5\1\2\u0101\u0102"+
		"\7\t\2\2\u0102\u0103\7\20\2\2\u0103\u0104\7\b\2\2\u0104\u0105\5\4\3\2"+
		"\u0105\u0106\b\5\1\2\u0106\u0108\3\2\2\2\u0107\u0101\3\2\2\2\u0108\u010b"+
		"\3\2\2\2\u0109\u0107\3\2\2\2\u0109\u010a\3\2\2\2\u010a\u010c\3\2\2\2\u010b"+
		"\u0109\3\2\2\2\u010c\u010d\b\5\1\2\u010d\u010e\7\5\2\2\u010e\u0163\3\2"+
		"\2\2\u010f\u0110\7\13\2\2\u0110\u0111\7\4\2\2\u0111\u0112\b\5\1\2\u0112"+
		"\u0113\7\20\2\2\u0113\u0114\7\b\2\2\u0114\u0115\5\4\3\2\u0115\u011e\b"+
		"\5\1\2\u0116\u0117\7\t\2\2\u0117\u0118\7\20\2\2\u0118\u0119\7\b\2\2\u0119"+
		"\u011a\5\4\3\2\u011a\u011b\b\5\1\2\u011b\u011d\3\2\2\2\u011c\u0116\3\2"+
		"\2\2\u011d\u0120\3\2\2\2\u011e\u011c\3\2\2\2\u011e\u011f\3\2\2\2\u011f"+
		"\u0121\3\2\2\2\u0120\u011e\3\2\2\2\u0121\u0122\b\5\1\2\u0122\u0123\7\5"+
		"\2\2\u0123\u0163\3\2\2\2\u0124\u0125\7\f\2\2\u0125\u0126\7\20\2\2\u0126"+
		"\u0127\7\n\2\2\u0127\u0128\5\b\5\2\u0128\u0129\b\5\1\2\u0129\u0163\3\2"+
		"\2\2\u012a\u012b\7\r\2\2\u012b\u0163\b\5\1\2\u012c\u012d\7\16\2\2\u012d"+
		"\u012e\7\20\2\2\u012e\u012f\7\b\2\2\u012f\u0130\5\4\3\2\u0130\u0131\b"+
		"\5\1\2\u0131\u0163\3\2\2\2\u0132\u0133\7\6\2\2\u0133\u0134\7\16\2\2\u0134"+
		"\u0135\7\20\2\2\u0135\u0136\7\b\2\2\u0136\u0137\5\4\3\2\u0137\u0141\b"+
		"\5\1\2\u0138\u0139\7\t\2\2\u0139\u013a\7\16\2\2\u013a\u013b\7\20\2\2\u013b"+
		"\u013c\7\b\2\2\u013c\u013d\5\4\3\2\u013d\u013e\b\5\1\2\u013e\u0140\3\2"+
		"\2\2\u013f\u0138\3\2\2\2\u0140\u0143\3\2\2\2\u0141\u013f\3\2\2\2\u0141"+
		"\u0142\3\2\2\2\u0142\u0144\3\2\2\2\u0143\u0141\3\2\2\2\u0144\u0145\7\7"+
		"\2\2\u0145\u0146\b\5\1\2\u0146\u0163\3\2\2\2\u0147\u0148\7\17\2\2\u0148"+
		"\u0149\7\20\2\2\u0149\u014a\7\b\2\2\u014a\u014b\5\4\3\2\u014b\u014c\b"+
		"\5\1\2\u014c\u0163\3\2\2\2\u014d\u014e\7\6\2\2\u014e\u014f\7\17\2\2\u014f"+
		"\u0150\7\20\2\2\u0150\u0151\7\b\2\2\u0151\u0152\5\4\3\2\u0152\u015c\b"+
		"\5\1\2\u0153\u0154\7\t\2\2\u0154\u0155\7\17\2\2\u0155\u0156\7\20\2\2\u0156"+
		"\u0157\7\b\2\2\u0157\u0158\5\4\3\2\u0158\u0159\b\5\1\2\u0159\u015b\3\2"+
		"\2\2\u015a\u0153\3\2\2\2\u015b\u015e\3\2\2\2\u015c\u015a\3\2\2\2\u015c"+
		"\u015d\3\2\2\2\u015d\u015f\3\2\2\2\u015e\u015c\3\2\2\2\u015f\u0160\7\7"+
		"\2\2\u0160\u0161\b\5\1\2\u0161\u0163\3\2\2\2\u0162\u00fa\3\2\2\2\u0162"+
		"\u010f\3\2\2\2\u0162\u0124\3\2\2\2\u0162\u012a\3\2\2\2\u0162\u012c\3\2"+
		"\2\2\u0162\u0132\3\2\2\2\u0162\u0147\3\2\2\2\u0162\u014d\3\2\2\2\u0163"+
		"\t\3\2\2\2\21\35\62a|\u0082\u0093\u00a8\u00d7\u00f2\u00f8\u0109\u011e"+
		"\u0141\u015c\u0162";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}