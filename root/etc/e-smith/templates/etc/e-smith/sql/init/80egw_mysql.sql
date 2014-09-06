# eGroupWare MySQL init template
#
# This files creates/updates eGroupWare's MySQL database


USE mysql;

CREATE DATABASE IF NOT EXISTS { $egroupware{DbName} };

REPLACE INTO user (
                     host,
                     user,
                     password)
            VALUES (
                     'localhost',
                     '{ $egroupware{DbUser} }',
                     PASSWORD ('{ $egroupware{DbPassword} }'));

REPLACE INTO db (
                   host,
                   db,
                   user,
                   select_priv, insert_priv, update_priv, delete_priv,
                   create_priv, alter_priv, index_priv, drop_priv, create_tmp_table_priv,
                   grant_priv, lock_tables_priv, references_priv) 
          VALUES (
                   'localhost',
                   '{ $egroupware{DbName} }',
                   '{ $egroupware{DbUser} }',
                   'Y', 'Y', 'Y', 'Y',
                   'Y', 'Y', 'Y', 'Y', 'Y',
                   'N', 'Y', 'Y');

FLUSH PRIVILEGES;
