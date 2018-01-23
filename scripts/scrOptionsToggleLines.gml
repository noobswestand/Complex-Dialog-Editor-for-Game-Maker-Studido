///scrOptionsToggleLines()
ini_open("settings.ini")
op0[0]=!op0[0]
ini_write_real("settings","lines",op0[0])
ini_close()
