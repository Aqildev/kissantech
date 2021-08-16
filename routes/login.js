const express=require('express')
const jwt = require('jsonwebtoken');
const db = require('../database/db');
const router=express.Router();
// const db=require('../database/db')
//login route for user


router.post('/login',async(req,res)=>{
      const {email,password}=req.body
      console.log(email,password)
      if(email && password)
      {
        try {
          result=await db.query('Select * from users where email=$1 and password=$2',[email,password])
          console.log(result.rows[0].user_id)
          user=result.rows[0].user_id
          
          jwt.sign({user}, 'secretkey', { expiresIn: '8h' }, (err, token) => {
            // res.json({
            //   token
            // });
          res.status(200).send({token:token,email:result.rows[0].email,mobile:result.rows[0].mobile})
          });
            
        } catch (error) {
          console.log(error)
        }
  
      }
      else
      {
        res.status(401).send("Missing Credentials")
      }
    
})
module.exports=router;

