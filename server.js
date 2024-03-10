const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
const sgMail = require('@sendgrid/mail');

const app = express();
const port = 3000;
app.use(express.json())

const db = new sqlite3.Database('MessiFootball.db');

app.get('/users', (req, res) => {
  // Query data
  db.all('SELECT * FROM users', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json(rows);
    }
  });
});



app.post('/users/send-email', (req, res) => {
  const { recipientEmail, subject, content } = req.body;

  sgMail.setApiKey('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')
  const msg = {
      to: recipientEmail,
      from: 'sakshammishra615@gmail.com', 
      templateId: 'd-b00dc189647d41a28e8b942b42624c83',
  dynamic_template_data: {
    subject: subject,
      text: content,
    // other dynamic data...
  },
      
  };

  sgMail
      .send(msg)
      .then(() => {
          console.log('Email sent');
          res.status(200).send('Email sent successfully');
      })
      .catch((error) => {
          console.error(error);
          res.status(500).send('Internal Server Error');
      });
});


app.get('/users/getapprovals', (req, res) => {
  // Query data
  db.all('SELECT id,name,age,waste_material FROM approvals where is_approved = 0', (err, rows) => {
    if (err) {
      console.error(err.message);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json(rows);
    }
  });
});




app.post('/users', (req, res) => {

  console.log(req.body);
  res.send(req.body);

  const { name, avatar } = req.body;

  console.log(name);
  console.log(avatar);
  db.run(
    "INSERT INTO users (username, avatar_url) SELECT ?, ? WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = ? and avatar_url = ?)",
    [name, avatar, name, avatar],
    function (err) {
        if (err) {
            console.error(err.message);
           
        } else {
            console.log("User inserted successfully");
            
        }
    }
);
  });




  app.post('/users/postform', (req, res) => {

    
    console.log(req.body);
    
    
    const {name ,age,waste_Material} = req.body
    
    console.log(name)
    console.log(age)
    console.log(waste_Material)
    
    db.run("INSERT INTO approvals (name,age,waste_material) VALUES (?,?,?)",name,age,waste_Material);
    
    res.send({message : "The Request has been placed successfully, Please wait Patiently"})
    
      });




  app.post('/users/admincheck', (req, res) => {

    
    console.log(req.body);
    
    
    const {name ,email} = req.body
    
    console.log(name)
    console.log(email)
    
    db.all ("select * from users where username = ? and is_admin = 1",name,(err,rows) => {

      if (err) {
        console.error(err.message);
        res.status(500).json({ error: 'Internal Server Error' });
      } 


      if (rows.length > 0){

        res.send({message : "Welcome  admin"});



      }






    });
    });

    
    
    
      

  app.delete('/users', (req, res) => {

    
    console.log(req.body);
    res.send(req.body)
    
    const {name ,email} = req.body
    
    console.log(name)
    console.log(email)
    
    db.run("Delete from users where email = ? and username = ?",email,name);
    
    
    
      });


 app.patch('/users', (req, res) => {

    
        console.log(req.body);
        res.send(req.body)
        
        const {name ,email} = req.body
        
        console.log(name)
        console.log(email)
        
        db.run("update users set username = ? where email = ?",name,email);
        
        
        
          });

          app.patch('/users/adminapprovals', (req, res) => {

    
            console.log(req.body);
            
            
            const {id} = req.body
            
            
            
            
            db.run("update approvals set is_approved = 1 where id = ?",id);
            res.send({message : "Approved by the Admin Congrats"})
            
            
            
              });
    

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}/`);
});

