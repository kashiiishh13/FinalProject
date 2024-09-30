import tkinter as tk
from tkinter import messagebox

# Function to handle login button click
def login():
    username = entry_username.get()
    password = entry_password.get()

    # Dummy credentials (replace with your actual authentication logic)
    if username == "admin" and password == "password":
        messagebox.showinfo("Login Successful", "Welcome, Admin!")
        # Add code here to open new window or perform other actions after successful login
    else:
        messagebox.showerror("Login Failed", "Invalid username or password")

# Create main window
root = tk.Tk()
root.title("Login")

# Create username label and entry
label_username = tk.Label(root, text="Username")
label_username.pack()
entry_username = tk.Entry(root)
entry_username.pack()

# Create password label and entry
label_password = tk.Label(root, text="Password")
label_password.pack()
entry_password = tk.Entry(root, show="*")  # Show * for password
entry_password.pack()

# Create login button
button_login = tk.Button(root, text="Login", command=login)
button_login.pack()

# Run the main loop
root.mainloop()
