import tkinter as tk
from utility.ObserverObjects import *

class AlgorithmConfiguration(tk.Toplevel):

    def __init__(self, maxwidth, maxheight, config=[]):
        tk.Toplevel.__init__(self, background='gray')
        self.title("Configure New Algorithm" if config == [] else config["alg_name"] + " Configuration")
        self.lname = tk.Label(self, text="Name", background='gray')
        self.lname.grid(row=0, column=0, sticky=tk.W, pady=15, padx=10)
        self.vname = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vname.grid(row=0, column=1, sticky=tk.W, pady=15, padx=10)
        self.vname.insert('1.0', "" if config == [] else config["alg_name"])
        self.lflag = tk.Label(self, text="Flags (flagname1,flagname2...)", background='gray')
        self.lflag.grid(row=1, column=0, sticky=tk.W, pady=15, padx=10)
        self.vflag = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vflag.grid(row=1, column=1, sticky=tk.W, pady=15, padx=10)
        self.vflag.insert('1.0', "" if config == [] else config["flag"])
        self.lexecflag = tk.Label(self, text="Execution Flags (flagname1,flagname2...)", background='gray')
        self.lexecflag.grid(row=2, column=0, sticky=tk.W, pady=15, padx=10)
        self.vexecflag = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vexecflag.grid(row=2, column=1, sticky=tk.W, pady=15, padx=10)
        self.vexecflag.insert('1.0', "" if config == [] else config["execution_flag"])
        self.lstexec = tk.Label(self, text="Standard Execution", background='gray')
        self.lstexec.grid(row=3, column=0, sticky=tk.W, pady=15, padx=10)
        self.vstexec = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vstexec.grid(row=3, column=1, sticky=tk.W, pady=15, padx=10)
        self.vstexec.insert('1.0', "" if config == [] else config["standard_exec"])
        self.lvflag = tk.Label(self, text="Graphic Flag", background='gray')
        self.lvflag.grid(row=4, column=0, sticky=tk.W, pady=15, padx=10)
        self.vvflag = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vvflag.grid(row=4, column=1, sticky=tk.W, pady=15, padx=10)
        self.vvflag.insert('1.0', "" if config == [] else config["visual_flag"])
        self.lsimfile = tk.Label(self, text="Simulation File (pathtofile/filename)", background='gray')
        self.lsimfile.grid(row=5, column=0, sticky=tk.W, pady=15, padx=10)
        self.vsimfile = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vsimfile.grid(row=5, column=1, sticky=tk.W, pady=15, padx=10)
        self.vsimfile.insert('1.0', "" if config == [] else config["simulation_file"])
        self.lwinpath = tk.Label(self, text="Path to Windows Executable", background='gray')
        self.lwinpath.grid(row=6, column=0, sticky=tk.W, pady=15, padx=10)
        self.vwinpath = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vwinpath.grid(row=6, column=1, sticky=tk.W, pady=15, padx=10)
        self.vwinpath.insert('1.0', "" if config == [] else config["win"])
        self.losxpath = tk.Label(self, text="Path to OSx Executable", background='gray')
        self.losxpath.grid(row=7, column=0, sticky=tk.W, pady=15, padx=10)
        self.vosxpath = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vosxpath.grid(row=7, column=1, sticky=tk.W, pady=15, padx=10)
        self.vosxpath.insert('1.0', "" if config == [] else config["osx"])
        self.llinuxpath = tk.Label(self, text="Path to Linux Executable", background='gray')
        self.llinuxpath.grid(row=8, column=0, sticky=tk.W, pady=15, padx=10)
        self.vlinuxpath = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vlinuxpath.grid(row=8, column=1, sticky=tk.W, pady=15, padx=10)
        self.vlinuxpath.insert('1.0', "" if config == [] else config["linux"])
        self.lexecpattern = tk.Label(self, text="Execution Pattern ([t1] [t2] [flags] are placeholders for subtype, supertype and flags respectively)", background='gray')
        self.lexecpattern.grid(row=9, column=0, sticky=tk.W, pady=15, padx=10)
        self.vexecpattern = tk.Text(self, font=("Purisa",15), width=int(maxwidth * 0.04), height=int(maxheight*0.0005), background='gray', highlightcolor='gray')
        self.vexecpattern.grid(row=9, column=1, sticky=tk.W, pady=15, padx=10)
        self.vexecpattern.insert('1.0', "" if config == [] else config["exec_comm"])
        self.save = tk.Button(self, text="Save Configuration", background='gray', highlightcolor='gray')
        self.save.grid(row=10, column=1, sticky=tk.E, pady=15, padx=10)
        self.save.configure(command=lambda:self.__on_save(config))



    def __on_save(self, config):
        ReloadConfigEvent({'alg_name': self.vname.get("1.0", "end-1c"), 'flag': self.vflag.get("1.0", "end-1c"), 'execution_flag': self.vexecflag.get("1.0", "end-1c"), 'standard_exec': self.vstexec.get("1.0", "end-1c"), 'visual_flag': self.vvflag.get("1.0", "end-1c"), 'simulation_file': self.vsimfile.get("1.0", "end-1c"), 'win': self.vwinpath.get("1.0", "end-1c"), 'osx': self.vosxpath.get("1.0", "end-1c"), 'linux': self.vlinuxpath.get("1.0", "end-1c"), 'exec_comm': self.vexecpattern.get("1.0", "end-1c")}, "" if config == [] else config["alg_name"])
        self.destroy()



