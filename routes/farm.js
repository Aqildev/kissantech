// express
var express=require('express')
var router=express.Router()
// const router=require('express').Router();
// const passport    = require('passport');
const db = require('../database/db');

require('../config/passport');
// router.use(passport.authenticate('jwt',{session:false}))


router.post('/farm_insert',passport.authenticate('jwt',{session:false}),async(req,res)=>{
    const {crop_id,total_acre,longitude,latitude,address,farm_name}=req.body
    user_id=req.user.user_id
    if(user_id,crop_id,total_acre,longitude,latitude,address,farm_name)
    {
        try {
            await db.query('insert into farm(Farm_Owner,crop_id,total_acre,logitude,latitude,address,farm_name) values($1,$2,$3,$4,$5,$6,$7)',[user_id,crop_id,total_acre,longitude,latitude,address,farm_name])
            res.status(200).send("Inserted")
        } catch (error) {
            console.log(error)
            res.status(400).send(error)
        }
    }

    console.log(user_id,crop_id,total_acre,longitude,latitude,address)
})

// gives farm details with repect to user type
router.get('/farm',async(req,res)=>{
    console.log(req.user)
    user=req.user

    if(user)
    {
        //Give farm details with managers if user is owner
        if(user.role_id==1)
        {
            try {
                result=await db.query(`Select farm.*,crops.crop_name from farm  
                inner join crops on farm.crop_id=crops.crop_id
                where farm_owner=$1
;
                `,[user.user_id])
                // result=await db.query(`Select farm.*,crops.crop_name,name,nic,mobile,city,country,email from farm inner join 
                // farm_managers on farm.farm_id=farm_managers.farm_id
                // inner join users on
                // farm_managers.farm_manager=users.user_id
                // inner join crops on farm.crop_id=crops.crop_id
                // where farm_owner=$1
                // Order by name ASC;
                // `,[user.user_id])
                console.log(result.rows) 
                res.status(200).send({farm:result.rows})
            } catch (error) {
                console.log(error)
                
            }
    
        }
    }
    // Give farm details with owner if user is manager
        if(user.role_id==2)
        {
            try {
                result=await db.query(`
                Select farm.*,crops.crop_name,name,email,mobile from farm_managers inner join
                farm on farm.farm_id=farm_managers.farm_id inner join
                users on users.user_id=farm.farm_owner
                inner join crops on farm.crop_id=crops.crop_id

                where farm_manager=$1
                Order by name ASC
                `,[user.user_id])
                console.log(result.rows) 
                res.status(200).send({farm:result.rows})
            } catch (error) {
                console.log(error)
                
            }
    
        }
    
    
})

module.exports=router;