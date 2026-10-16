const { app, BrowserWindow, Menu } = require('electron');
const path = require('path');

function createWindow() {
  const win = new BrowserWindow({
    width: 1366,
    height: 820,
    minWidth: 1024,
    minHeight: 700,
    title: "Daily Finishing QI Report · Colossus Apparel",
    icon: path.join(__dirname, 'Colossus.jpeg'), // অ্যাপের আইকন
    backgroundColor: '#0b1e33',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      enableRemoteModule: false
    }
  });

  // মেনুবার হাইড করতে চাইলে (ক্লিন ও প্রফেশনাল লুকের জন্য):
  Menu.setApplicationMenu(null);

  // আপনার মূল index.html ফাইল লোড করা
  win.loadFile('index.html');

  // উইন্ডো ফুল স্ক্রিন বা ম্যাক্সিমাইজড করে খুলতে চাইলে:
  // win.maximize();
}

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});
