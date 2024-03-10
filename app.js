const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('MessiFootball.db');

// Create a table
db.serialize(() => {
  db.run('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, avatar_url TEXT)');

  // Insert data
  const insertStmt = db.prepare('INSERT INTO users (username,avatar_url ) VALUES (?, ?)');
  insertStmt.run('Mohan', 'john@example.com');
  insertStmt.run('Sohan', 'jane@example.com');
  insertStmt.finalize();

  // Query data
  db.each('SELECT * FROM users where id = 8', (err, row) => {
    if (err) {
      console.error(err.message);
    } else {
      console.log(`User ID: ${row.id}, Username: ${row.username}, Email: ${row.email}`);
    }
  });
});

// Close the database connection
db.close();
