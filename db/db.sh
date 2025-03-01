sqlite3 ./database.db <<EOF
-- Create users table with roles
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username TEXT UNIQUE,
  password_hash TEXT,
  role TEXT CHECK(role IN ('user', 'admin')) NOT NULL
);

-- Add users with roles (passwords hashed using SHA-256)
-- Hash for 'user1' = user1, 'user2' = user2, 'admin' = admin
INSERT INTO users (username, password_hash, role) VALUES 
  ('user1', '0a041b9462caa4a31bac3567e0b6e6fd9100787db2ab433d96f6d178cabfce90', 'user'),
  ('user2', '6025d18fe48abd45168528f18a82e265dd98d421a7084aa09f61b341703901a3', 'user'),
  ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin');
EOF

# echo -n user1 | sha256sum
# echo -n user2 | sha256sum
# echo -n admin | sha256sum
