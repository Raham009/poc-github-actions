import mysql.connector 

db = mysql.connector.connect(host="127.0.0.1", user="devuser", passwd="abcd1234", db="development-db") 
cur = db.cursor() 
name = input('Enter Name: ') 
cur.execute("SELECT * FROM userdata WHERE Name = '%s';" % name) 
for row in cur.fetchall(): 
    print(row) 
db.close()
