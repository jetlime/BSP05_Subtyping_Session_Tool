# Subtyping Type Session Tool SourceCode & Executable

The technical deliverable is based on the session subtyping tool built by Lorenzo Bacchiani in the python programming language using executable Haskell programs. The tool is publicly available on github, ([repository link](https://github.com/LBacchiani/session-subtyping-tool)).
 His tool allows to apply different subtyping algorithms that will simulate subtyping in order to check subtyping of two session types. We will design and build into this tool a new asynchronous session subtyping algorithm proven by my tutor Ross James Horne. By extending it, the tool will support parallel session types, which act as internal communications.

## Folders
All exectuables and source code needed for the entire software,

* *Final_SubTyping_Session_Tool*: Source code & Executable files needed to run the sotware all combined.
  
Source code folders, these folders are all structured the same way. The haskell source code is in the folder, *app*. The dependencies needed to compile the source code are located in *package.yaml*, under the *dependencies* section.

* *main-parser* : Source Code of the main parser of the tool modified such that the Parser supports internal communications of session types. 
* *compiling-Viewer* : Source code from the viewer executable. The viewer originates from the original tool, it was modified such that we can visulize parallel subtyping under the form of an automata.
* Horne-Alg : Implementation of the parallel subtyping algorithm developped by Ross James Horne.

## Run the software

### Requirements
* Python 3.6 or greater
* Have Graphviz installed.
* The dot command from Graphviz has to be in your PATH.

### Run it 

You simply need to execute the python script *SessionSubtypingTool.py*, located in the *Final_SubTyping_Session* folder.

```bash
python3 SessionSubtypingTool.py
```

## Source Code Usage

This tutorial will make you understand how to use the parallel subtyping checker algorithm developed by Ross James Horne. The souce code is present in the Horne-Alg folder of this repository.

### Requirements

* stack ([install](https://docs.haskellstack.org/en/stable/install_and_upgrade/)), or any other Haskell compiler.
* With cabal or stack for example, you will have to download haskell package in order to compile the source code. Refer to the *package.yaml* file to know which dependencies need to be installed.


### Compiling Haskell source codes:
Tutorial for *stack* compiler,

* Choose a one of the three source code folders
* Open a terminal, in the folder \<Folder Name>, e.g *Horne-Alg*
* run the following command, *stack build*
* The generated executable file is located in "Horne-Alg\.stack-work\dist\274b403a\build\Horne-Alg-exe\Horne-Alg-exe.exe"

The executable can then be added to the extended program of Lorenzo Bacchiani (1.) or executed in the command line (2.).

1. * Move the generated executable file inside Final_SubTyping_Session\parallel-subtyping\ \<your OS>, name the file *Checker.exe * instead of *Main.exe*
   * Run the Application: python Final_SubTyping_Session\SessionSubtypingTool.py
2. Here, we assume that you have a terminal open and that you are in *Horne-Alg* folder.
To execute the file with the proper command, stack exec Horne-Alg-exe tmp/sub.txt tmp/sup.txt Horne
   * parameter1: path of the subtype stored in a .txt file
   * parameter2: path of the supertype stored in a .txt file
   * parameter3: execution flag determining the algortihm mode, with "Horne", the supertype is dualised at the beginning, with "OtherWay" the subtype is dualized at the beginning.