# Subtyping Type Session Tool SourceCode & Executable

The technical deliverable is based on the session subtyping tool built by Lorenzo Bacchiani in the python programming language using executable Haskell programs. The tool is publicly available on github, ([repository link](https://github.com/LBacchiani/session-subtyping-tool)).
 His tool allows to apply different subtyping algorithms that will simulate subtyping in order to check subtyping of two session types. We will design and build into this tool a new asynchronous session subtyping algorithm proven by my tutor Ross James Horne. By extending it, the tool will support parallel session types, which act as internal communications. Part of this readme is taken from the original tool's repository.

## Download 
The latest version can be downloaded in the ([releases section](https://github.com/jetlime/Subtyping_Session_Tool_SourceCode/releases)) of this repository. Once downloaded you can follow the **Run the Sodtware** section if you have a windows machine. Otherwise, you can compile the suited executables by following the **Source Code Usage** section.

## Folders
Description of every folder in this repository,

* *Subtyping-Checker-Extension*: Complete extended version of the Subtyping Checker Tool.
  
Source code folders, these folders are all structured the same way. The haskell source code is in the folder, *app*. The dependencies needed to compile the source code are located in *package.yaml*, under the *dependencies* section.

* *main-parser* : Source Code of the main parser of the tool modified such that the Parser supports internal communications of session types. 
* *compiling-Viewer* : Source code from the viewer executable. The viewer originates from the original tool, it was modified such that we can visulize parallel subtyping under the form of an automata.
* Horne-Alg : Implementation of the parallel subtyping algorithm developped by Ross James Horne in the Haskell programing language.

## Run the software

### Requirements
* Python 3.6 or greater
* Have Graphviz installed.
* The dot command from Graphviz has to be in your PATH.

### Run it 

Execute the python script *SessionSubtypingTool.py*, located in the *Final_SubTyping_Session* folder.

```bash
python3 SessionSubtypingTool.py
```
The Graphical User Interface will open up.

## Source Code Usage

In this section, it is specified out to compile the source code, in case you need to recompile it or use any other OS then Windows.

### Requirements

* stack ([install](https://docs.haskellstack.org/en/stable/install_and_upgrade/)), or any other Haskell compiler.
* With cabal or stack, for example, you will have to download Haskell package in order to compile the source code. Refer to the *package.yaml* file to know which dependencies need to be installed.


### Compiling Haskell source codes:

* In the *Subtyping-Checker-Extension* folder, 
* For each each folder in the folder *session-type-utilities*,
  * Open a terminal in the given folder
  * Compile the source code of the folder with any Haskell Compiler, the main files to be executed are, 
    * Main.hs for the Parser
    * Checker.hs for the Algortihms
    * Viewer.hs for the Viewer
  * Move the generated .exe file in the correct folder:
      * Move asynchronous subtyping algorithm executable to asynchronous-subtyping/your OS
      * Mov fair asynchronous subtyping algorithm executable to fair-asynchronous-subtyping/your OS
      * Move synchronous subtyping algorithm executable to sync_subtyping/your OS
      * Move parallel subtyping algorithm executable to parallel-subtyping/your OS
      * Move type viewer executable to viewer/your OS
      * Move type parser executable to parser/your OS