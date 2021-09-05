const io = require("socket.io-client");

const socket = io("http://192.168.1.33:3000");

socket.connect();

socket.emit('send_hi');
socket.on('hello', () => console.log('ok'))