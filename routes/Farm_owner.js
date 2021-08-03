var express=require('express')
var router=express.Router()
const passport = require('passport')
const db=require('../database/db')
// require('../config/passport')

// router.use(passport.authenticate('jwt',{session:false}))


router.post('/AssignManagers',async(req,res)=>{
    const {farm_id,manager_id}=req.body
    if(req.user.role_id==1)
    {
        try {
            await db.query('Insert into farm_managers(farm_manager,farm_id) values($1,$2)',[manager_id,farm_id])
            res.status(200).send("Managers added")
        } catch (error) {
            console.log(error)
            res.status(400).send("Mangers assignment unsuccessful")
        }
    }
    else
    {
        res.status(401)
    }


})

module.exports=router;
