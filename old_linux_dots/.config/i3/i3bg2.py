#!/usr/bin/env python3
import Xlib.threaded
import Xlib
import Xlib.display
from Xlib import Xatom
from PIL import Image
import os.path
from collections import defaultdict

try:
	import i3ipc.i3ipc as i3ipc
except ImportError:
	import i3ipc

Image.Image.tostring = Image.Image.tobytes

backgrounds = defaultdict(lambda: "#FFFFFF", {
	"1": "~/Pictures/.wall/2.jpg",
	"2": "~/Pictures/.wall/2.jpg",
	"3": "~/Pictures/.wall/3.jpg",
	"4": "~/Pictures/.wall/4.jpg",
	"5": "~/Pictures/.wall/5.jpg",
	"6": "~/Pictures/.wall/6.jpg",
	"7": "~/Pictures/.wall/7.jpg",
	"8": "~/Pictures/.wall/8.jpg",
	"9": "~/Pictures/.wall/9.jpg",
	"10": "~/Pictures/.wall/10.jpg",
})

i3ipc.WorkspaceEvent = lambda data, conn: data
i3ipc.GenericEvent = lambda data: data
i3ipc.WindowEvent = lambda data, conn: data
i3ipc.BarconfigUpdateEvent = lambda data: data
i3ipc.BindingEvent = lambda data: data
i3ipc.Con = lambda data, parent, conn: data
i3 = i3ipc.Connection()

background_cache = {}

def change_workspace(name):
	display = Xlib.display.Display()
	screen = display.screen()
	root = screen.root

	w, h = screen.width_in_pixels, screen.height_in_pixels

	if (name, w, h) not in background_cache:
		background_cache[name, w, h] = gen_bg(root.create_pixmap(w, h, screen.root_depth), name)

	id = background_cache[name, w, h].id
	root.change_property(display.get_atom("_XROOTPMAP_ID"), Xatom.PIXMAP, 32, [id])
	root.change_property(display.get_atom("ESETROOT_PMAP_ID"), Xatom.PIXMAP, 32, [id])
	root.change_attributes(background_pixmap=id)
	root.clear_area()
	display.sync()

def gen_bg(pixmap, name):
	geom = pixmap.get_geometry()
	w, h = 1366, 768
	paint = pixmap.create_gc()
	bg = backgrounds[name]
	if bg[:1] == '#':
		paint.change(foreground=int(bg[1:], 16))
		pixmap.fill_rectangle(paint, 0, 0, w, h)
	else:
		im = Image.open(os.path.expanduser(bg))
		im.thumbnail((w, h), Image.ANTIALIAS)
		pixmap.put_pil_image(paint, 0, 0, im)
	return pixmap

for output in i3.get_outputs():
	if output["current_workspace"]:
		change_workspace(output["current_workspace"])

def workspace_event(i3, evt):
	if evt["change"] != "focus":
		return
	change_workspace(evt["current"]["name"])

	i3.on("workspace", workspace_event)
	i3.subscriptions = 0xFF
	i3.main()
