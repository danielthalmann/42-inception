

CREATE DATABASE wordpress;

GRANT ALL PRIVILEGES ON wordpress.* TO "wordpressuser"@"%" IDENTIFIED BY "Pa22w@rb";

FLUSH PRIVILEGES;
