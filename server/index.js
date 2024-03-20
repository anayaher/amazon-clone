//IMPORTS FROM PACKAGE
const express = require('express');
const mongoose = require('mongoose');

//IMPORTS FROM OTHER FILE
const authRouter = require('./routes/auth');


const PORT = 3000;
const DB = "mongodb+srv://aheranay:anayFlutterAmazon@cluster0.kakiawq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
const app = express();
//MIDDLEWARE
app.use(express.json());
app.use(authRouter);

//CONNECTIONS
mongoose.connect(DB).then(
    console.log("Connected TO MONGO DB")
).catch((e)=>
{
    console.log(e)
})


app.get('/hello-world',(req,res)=>
{
    res.send("Hello World");
});
app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Connected At ${PORT}`)
});