const express=require('express')

const router=express.Router();
const passport = require('passport')
const db=require('../database/db')
require('../config/passport')
const multer=require('multer')



const fileStorageEngine = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, "./images"); //important this is a direct path fron our current file to storage location
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + "--" + file.originalname);
    },
  });
  
  const upload = multer({ storage: fileStorageEngine });


router.post('/cases',async(req,res)=>{
    console.log(req.user)
    const {farm_id,temperature,wind_speed,weather,humidity,case_topic,case_desc,images}=req.body
    AdditionalData={
        temperature:temperature,
        wind_speed:wind_speed,
        weather:weather,
        humidity:humidity
    }
    // let crop_id=null
    try {
        crop_id=await db.query('Select crop_id from farm')
        crop_id=crop_id.rows[0].crop_id
        console.log(crop_id)
    } catch (error) {
        console.log(error)

    }
    console.log(case_topic,case_desc,AdditionalData,farm_id,crop_id)
    if(case_topic,case_desc,AdditionalData,farm_id,crop_id,images)
    {
        try {
            console.log(case_topic,case_desc,AdditionalData,farm_id,crop_id)
            // console.log(req.files)
            cases=await db.query(`
            insert into cases(case_topic,case_desc,AdditionalData,farm_id,crop_id) values ($1,$2,$3,$4,$5) Returning case_id`,[case_topic,case_desc,AdditionalData,farm_id,crop_id])
            let case_id=cases.rows[0].case_id
            console.log(case_id)
            for(i=0;i<images.length;i++)
            {
                img_address=images[i]//'/images/'+req.files[i].filename
                await db.query(`insert into images(image,case_id) values($1,$2)`,[img_address,case_id])

            }
            res.status(200).send('Successfull')
        } catch (error) {
            console.log(error)
            res.status(400).send()
        }
    }
    else {
        res.status(400).send("missing details")
    }
    console.log('acessible')
})

router.get('/cases',async(req,res)=>{
    farm_id=req.query.farm_id
    console.log(req.query)
    try {
        cases=await db.query(`
        Select * from cases where farm_id=$1`,[farm_id])
        cases=cases.rows
        console.log(cases[0])
        for(i=0;i<cases.length;i++)
        {
            image=await db.query(`
            Select image from images where case_id=$1 `,[cases[i].case_id])
            // console.log(image.rows)
            image=image.rows
            let images = image.map(a => a.image);
            // console.log(images)
            cases[i].images=images
            console.log(cases[i])
    
        }
        res.status(200).send({case:cases})

    } catch (error) {

        console.log(error)
    }
})





module.exports=router