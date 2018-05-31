const electron = require('electron')
const path = require('path')
const url = require('url')
//const mysql = require('mysql')
// Adicion de librerias esenciales

const {app, BrowserWindow, ipcMain} = electron
// Creacion de objetos

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    show: false,
    frame: false,
    resizable: true,
    backgroundColor: '#2e2c29',
    opacity: 0.5
  })

  mainWindow.loadURL(
    url.format({
    pathname: path.join(__dirname, 'View/login.html'),
    protocol: 'file:',
    slashes: true
    })
  )

  mainWindow.once('ready-to-show', () =>{
    mainWindow.show()
  })

  mainWindow.on('closed', function () {
    mainWindow = null
  })
}

const interfaces = 'interfaces/'
// Definicion de variables de directorios
ipcMain.on('fullscreen', () => {

	if (mainWindow.isFullScreen())
		mainWindow.setFullScreen(false)
	else
		mainWindow.setFullScreen(true)

})

ipcMain.on('minimize', () => { mainWindow.minimize() })
ipcMain.on('maximize', () => {

	if (mainWindow.isMaximized())
		mainWindow.unmaximize()
	else
		mainWindow.maximize()

})
ipcMain.on('close', () => { mainWindow.close() })

app.on('ready', function (){

  if(false){
      //Si es la primera vez, configura la BD y demas cosas
  }else{
    createWindow()
  }
})

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') {
    app.quit()
  }
  // colocar pantalla de despedida, cerrar base de datos y salir
})

app.on('activate', function () {
  if (mainWindow === null) {
    createWindow()
  }
})
