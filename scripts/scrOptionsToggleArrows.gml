///scrOptionsToggleArrows()
ini_open("settings.ini")
op0[1]=!op0[1]
ini_write_real("settings","arrows",op0[0])
ini_close()
