const { query } = require('../database/db');
const db = require('../database/db')

const router=require('express').Router();
// db=require('../database/db');

router.post('/sign_up',async(req,res)=>{
    console.log(req.body)
    //destructuring
    let {name,password,email,role_id,NIC ,mobile,city, country  }=req.body

    //assigning null if values are undefined
    city=city ? city:null
    NIC=NIC ? NIC:null
    mobile=mobile ? mobile:null
    country=country ? country:null
    console.log(name,password,role_id)
    if(email && password)
    {
        try {
            user=await db.query('Select user_id from users where email=$1',[email])
            console.log(user.rows[0])
        } catch (error) {
         console.log(error)   
        }
        try {
            await db.query('Insert into users(name,password,email,role_id,NIC ,mobile,city, country) values($1,$2,$3,$4,$5,$6,$7,$8)',[name,password,email,role_id,NIC ,mobile,city, country])
            res.status(200).send('Signup Successfull')
        } catch (error) {
            console.log(error)
        }
    }
    else
    {
        res.status(401).send({error:"Missing Credentials"})
    }

})







module.exports=router;
