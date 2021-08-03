const {Pool}=require('pg');
let user="postgres"
let password="aqil456"
let port=5432
let database= "KisanTech"
const pool=new Pool({
    user:user,
    password:password,
    port:port,
    database: database
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
