const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
const sgMail = require('@sendgrid/mail');

const app = express();
const port = 3000;
app.use(express.json())

const db = new sqlite3.Database('MessiFootball.db');


app.post('/users', (req, res) => {

  console.log(req.body);
  res.send(req.body);

  const { name, avatar } = req.body;

  console.log(name);
  console.log(avatar);


  const query = `SELECT * FROM users WHERE avatar_url = ?`;
    db.get(query, [avatar], (err, row) => {
        if (err) {
            console.error('Error querying database:', err);
            res.status(500).send('Error querying database');
            return;
        }
        
        if (row) {
            // User already exists
            console.log('User already exists');
            
        } else {
           
            const insertQuery = `INSERT INTO users (username, avatar_url) VALUES (?, ?)`;
            db.run(insertQuery, [name, avatar], (err) => {
                if (err) {
                    console.error('Error inserting user:', err);
                    
                } else {
                
                
                
                  console.log('User registered successfully');
                    
                }

                
  sgMail.setApiKey('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')
  const msg = {
      to: avatar,
      from: 'sakshammishra615@gmail.com', 
      templateId: 'd-b00dc189647d41a28e8b942b42624c83',
  dynamic_template_data: {
    subject: "Welcome to the Ultimate Football App",
      text: "Welcome {name} to the app and enjoy",
    
  },
  
  };

  sgMail
      .send(msg)
      .then(() => {
          console.log('Email sent');
          
      })
      .catch((error) => {
          console.error(error);
          
      });

    



            });
        }
    });
  
  
  });


app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}/`);
});
