# Subtyping_Session_Tool_SourceCode

The technical deliverable is based on the session subtyping tool built by Lorenzo Bacchiani in the python programming language using executable Haskell programs. His tool allows to apply different subtyping algorithms that will simulate subtyping in order to check subtyping of two session types. We will design and build into this tool a new asynchronous session subtyping algorithm proven by my tutor Ross Hornes. By extending it, the tool will support parallel session types, acting as internal communications.

## Folders

* main-parser : Main parser of the tool modified such that the Parser supports parallel subtyping defined by "|". And the dual of "|", namely "$".
* compiling-Viewer : Source code from the viewer executable, to be modified such that we can visulize parallel subtyping under the form of an automata.(Not developped yet)
* Horne-Alg : Current work on the implementation of the parallel subtyping algorithm developped by Ross Hornes.
* Final_SubTyping_Session_Tool: The complete tool that executed with the already implemented modifications.

## Source Code Usage

This tutorial will make you understand how to use the parallel subtyping checker algorithm developed by James Horne. The souce code is present in the Horne-Alg folder of this repository.

### Requirements

    * stack ([install](https://docs.haskellstack.org/en/stable/install_and_upgrade/))
    * The following Haskell packages need to be installed (with cabal or stack for example),  
        - base >= 4.7 && < 5
        - pretty
        - parsec 
        - containers 
        - filepath
        - cmdargs
        - time
        - multiset


### Compiling Haskell sources:

* Open a terminal, in the folder Horne-Alg
* run the following command, stack build
* The generated executable file is located in "Horne-Alg\.stack-work\dist\274b403a\build\Horne-Alg-exe\Horne-Alg-exe.exe"

The executable can then be added to the extended program of Lorenzo Bacchiani (1.) or executed in the command line (2.).

1. 
* Move the generated executable file inside Final_SubTyping_Session\parallel-subtyping\<your OS>, name the file Checker.exe instead of Main.exe
* Run the Application: python Final_SubTyping_Session\SessionSubtypingTool.py
2. 
Here, we assume that you have a terminal open and that you are in "Horne-Alg\." folder.
To execute the file with the proper command, stack exec Horne-Alg-exe tmp/sub.txt tmp/sup.txt Horne
* parameter1: path of the subtype stored in a .txt file
* parameter2: path of the supertype stored in a .txt file
* parameter3: execution flag determining the algortihm mode, with "Horne", the supertype is dualised at the beginning, with "OtherWay" the subtype is dualized at the beginning.