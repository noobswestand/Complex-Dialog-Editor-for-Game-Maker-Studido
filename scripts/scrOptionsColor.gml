///scrOptionsColor()
ini_open("settings.ini")
op0[5]=!op0[5]
ini_write_real("settings","color",op0[5])
ini_close()
