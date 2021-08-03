const express=require('express')

const router=express.Router();
const passport = require('passport')
const db=require('../database/db')
require('../config/passport')


router.get('/crops',async(req,res)=>{

    console.log("crops")
    try {
        crops=await db.query('Select * from crops')
        res.status(200).send({crops:crops.rows})
    } catch (error) {
        console.log(error)
    }
})

module.exports=router;