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
  // Create the browser window.
  // Hay que agregar botones de minimizar, maximizar y cerrar
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    show: false,
    frame: false,
    resizable: true,
    backgroundColor: '#2e2c29',
    title: 'Visual',
    opacity: 0.5
  })

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

mainWindow.once('ready-to-show', () =>{
  if(false){
      //Si es la primera vez, configura la BD y demas cosas
  }else{
    createWindow()
  }
})

  // and load the index.html of the app.
mainWindow.loadURL(
    url.format({
    pathname: path.join(__dirname, 'View/index.html'),
    protocol: 'file:',
    slashes: true
    })
)

  // Open the DevTools.
  // mainWindow.webContents.openDevTools()

  // Emitted when the window is closed.
mainWindow.on('closed', function () {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
  mainWindow = null
})


// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.

// Quit when all windows are closed.
app.on('window-all-closed', function () {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
  // colocar pantalla de despedida, cerrar base de datos y salir
})

app.on('activate', function () {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow()
  }
})
