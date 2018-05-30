const {ipcRenderer} = require('electron')
	function windows(accion){
		ipcRenderer.send(accion)
	}
