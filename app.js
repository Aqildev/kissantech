//importing 
// const jwt = require('jsonwebtoken');
express=require('express');
cors=require('cors');
db=require('./database/db');
//requiring Routes
login=require('./routes/login')
cases=require('./routes/case')
sign_up=require('./routes/sign_up')
farm=require('./routes/farm')
crops=require('./routes/crop')
consultant =require('./routes/consultant')
farm_owner=require('./routes/Farm_owner')


const app=express();
//usign modules
app.use(express.json());
app.use(express.urlencoded({ extends: true }));
app.use(cors())
app.use(express.static(__dirname + '/images'))
const passport = require('passport');

require('./config/passport');

//using routes without authentication
app.use(login)
app.use(sign_up)
app.use(express.static(__dirname))
//middleaware to authenticate all routes below it
app.use(passport.authenticate('jwt',{session:false}))

//using routes with authentication
app.use(farm)
app.use(farm_owner)
app.use(cases)
app.use(crops)
app.use(consultant)

// app.get('/',passport.authenticate('jwt',{session:false}), async(req, res) => {
  //   console.log(req.user)
  // })


app.listen(5000,()=>{
    console.log("server up")
})