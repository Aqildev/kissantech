const {Pool}=require('pg');
let user="postgres"
let password="aqil456"
let port=5432
let database= "KisanTech"
// const pool=new Pool({
//     user:user,
//     password:password,
//     port:port,
//     database: database
// });
const DATABASE_URL='postgres://sxpzmoxfdftxvi:714ca275d31510ded1713eeb9511ca0645f30d1f96da64dcfe6cf00a65fc4da6@ec2-54-227-246-76.compute-1.amazonaws.com:5432/d9dr4qc34rujgs'
const pool = new Pool({
  connectionString: DATABASE_URL,//process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

module.exports = {
    async query(text, params) {
      const start = Date.now()
      const res = await pool.query(text, params)
      const duration = Date.now() - start
      console.log('executed query', { text, duration, rows: res.rowCount })
      return res
    }
}
