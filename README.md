# Subtyping_Session_Tool_SourceCode

The technical deliverable is based on the session subtyping tool built by Lorenzo Bacchiani in the python programming language using executable Haskell programs. His tool allows to apply different subtyping algorithms that will simulate subtyping in order to check subtyping of two session types. We will design and build into this tool a new asynchronous session subtyping algorithm proven by my tutor Ross Hornes. By extending it, the tool will support parallel session types, acting as internal

Folders :

```
- main-parser : Main parser of the tool modified such that the Parser supports parallel subtyping defined by "|". And the dual of "|", namely "$".
```

```
- compiling-Viewer : Source code from the viewer executable, to be modified such that we can visulize parallel subtyping under the form of an automata.(Not developped yet)
```

```
- Horne-Alg : Current work on the implementation of the parallel subtyping algorithm developped by Ross Hornes. 
```

```
- Final_SubTyping_Session_Tool: The complete tool that executed with the already implemented modifications.
```
