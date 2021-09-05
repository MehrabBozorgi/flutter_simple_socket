const server = require('http').createServer();
const io = require('socket.io')(server);
console.log("started");

io.on('connection', client => {
    console.log("conencted");

    client.on("send_hi", () =>{
        client.emit("hello");
	
    })

    //ارسال داده
    client.on("send_data", data =>{
        client.emit("data", "your data = " + data);
    })
});
server.listen(3000);
