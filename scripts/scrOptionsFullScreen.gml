///scrOptionsToggleLines()
ini_open("settings.ini")
op0[3]=!op0[3]
window_set_fullscreen(op0[3])
ini_write_real("settings","fullscreen",op0[3])
ini_close()
