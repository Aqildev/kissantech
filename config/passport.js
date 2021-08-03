var JwtStrategy = require('passport-jwt').Strategy;
var ExtractJwt = require('passport-jwt').ExtractJwt;
db=require('../database/db')
passport=require('passport')


const opt={};
opt.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opt.secretOrKey = 'secretkey';
passport.use(
    new JwtStrategy(opt,async(token,next)=>{

        console.log(token.user)
        try {
            result=await db.query('Select * from users where user_id=$1 ',[token.user])
            user=result.rows[0]
            return next(null,user)
                
        } catch (error) {
            console.log("abcd")
            return next(null)
            
        }

    })
    
)

// module.exports=(passport)=>{
//     const opt={};
//     opt.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
//     opt.secretOrKey = 'secretkey';
//     passport.use(
//         new JwtStrategy(opt,async(token,next)=>{

//             console.log(token.user)
//             try {
//                 result=await db.query('Select * from users where user_id=$1 ',[token.user])
//                 user=result.rows[0]
//                 return next(null,user)
                    
//             } catch (error) {
//                 return next(null)
                
//             }

//         })
        
//     )
// }