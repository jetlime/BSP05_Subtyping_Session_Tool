# Generated from SessionType.g4 by ANTLR 4.8
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .SessionTypeParser import SessionTypeParser
else:
    from SessionTypeParser import SessionTypeParser

# This class defines a complete generic visitor for a parse tree produced by SessionTypeParser.

class SessionTypeVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by SessionTypeParser#start.
    def visitStart(self, ctx:SessionTypeParser.StartContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SessionTypeParser#stype.
    def visitStype(self, ctx:SessionTypeParser.StypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SessionTypeParser#sprimetype.
    def visitSprimetype(self, ctx:SessionTypeParser.SprimetypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by SessionTypeParser#guarded.
    def visitGuarded(self, ctx:SessionTypeParser.GuardedContext):
        return self.visitChildren(ctx)



del SessionTypeParser