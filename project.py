from tkinter import *
import customtkinter
import subprocess

root=customtkinter.CTk()
root.geometry("700x600")
# root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth(), root.winfo_screenheight()))

def open_excel():
    process = subprocess.Popen(['powershell', '-ExecutionPolicy', 'Bypass', '-File', r'C:\Users\kashi\OneDrive\Desktop\Audit_Modules\Password Script.ps1'])
    process.wait()

button=customtkinter.CTkButton(master=root,text="button", command=open_excel)
button.place(relx=0.5, rely=0.5, anchor=CENTER)

root.mainloop()
