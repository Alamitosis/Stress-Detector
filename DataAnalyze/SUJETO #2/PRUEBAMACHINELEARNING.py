import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import tkinter as tk
from tkinter import ttk

datos = "P2.xlsx"

df = pd.read_excel(datos)

fig, axs = plt.subplots(len(df.columns)-1, figsize=(600, 7), dpi=100)

x = df["Tiempo"]

for i, col in enumerate(df.columns[1:]):
    y = df[col]
    axs[i].plot(x, y)
    axs[i].set_xlim(0,1820)
    axs[i].set_ylim(-1,1)
    #axs[i].set_yticks(range(0,1,0.001))
    axs[i].set_xticks(range(0,1820,1))
    
  
    

plt.tight_layout()

root = tk.Tk()
root.title("Señales EEG")
root.geometry("1300x700")

# Crear un marco para contener el Canvas y la barra de desplazamiento
frame = tk.Frame(root)
frame.pack(pady=10)

# Crear un Canvas
canvas = tk.Canvas(frame, width=1200, height=1000)
canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

# Agregar el lienzo a la ventana del Canvas
fig_canvas = FigureCanvasTkAgg(fig, master=canvas)
fig_canvas.draw()
fig_canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)

# Configurar la barra de desplazamiento horizontal
scrollbar = ttk.Scrollbar(frame, orient=tk.HORIZONTAL, command=canvas.xview)
scrollbar.pack(side=tk.BOTTOM, fill=tk.X)

# Configurar el lienzo para que utilice la barra de desplazamiento
canvas.configure(xscrollcommand=scrollbar.set)
canvas.create_window((0, 0), window=fig_canvas.get_tk_widget(), anchor=tk.NW)

# Configurar la función de desplazamiento en el lienzo y la barra de desplazamiento
def scroll_canvas(*args):
    canvas.xview(*args)

scrollbar.configure(command=scroll_canvas)

root.mainloop()