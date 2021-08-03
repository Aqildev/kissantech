const express=require('express')

const router=express.Router();
const passport = require('passport')
const db=require('../database/db')
require('../config/passport')


router.put('/AcceptCase',async(req,res)=>{
    user=req.user
    const {Case}=req.body
    if(user.role_id==3)
    {
        if(Case)
        {
            console.log(req.user)
            console.log(Case)
            try {
                await db.query('update cases set consultant_id=$1,case_status=$2 where case_id=$3',[user.user_id,'Accepted',Case])
                res.send(200)
            } catch (error) {
                console.log(error)
            }
        }
        else
        {
            res.send(400)
        }
    
    }
    else
    {
        res.status(401).send()
    }
})

router.put('/AddRemark',async(req,res)=>{
    user=req.user
    const {Case,remark}=req.body
    if(user.role_id==3)
    {
        if(Case && remark)
        {
            console.log(req.user)
            console.log(Case)
            try {
                await db.query('update cases set remarks=$1,case_status=$2 where case_id=$3',[remark,'Completed',Case])
                res.send(200)
            } catch (error) {
                console.log(error)
            }
        }
        else
        {
            res.send(400)
        }
    
    }
    else
    {
        res.status(401).send()
    }
})

module.exports=router;