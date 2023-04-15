const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const http = require("http");
const authRouter = require("./routes/auth") 

const PORT = process.env.PORT || 3001; 

const app = express();

app.use(cors());
app.use(express.json());
app.use(authRouter);  

const DB = "mongodb://127.0.0.1:27017/docs_clone"; 

mongoose.connect(DB).then(() => {
    console.log("Connection successful!");
}).catch((err) => {
    console.log(err); 
})

app.listen(PORT, "0.0.0.0", ()=> {
    console.log(`connection at port: ${PORT}`); 
})