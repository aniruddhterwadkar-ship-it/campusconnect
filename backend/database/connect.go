package database
import(
	"fmt"
	"database/sql"
	"os"
	_ "github.com/go-sql-driver/mysql"
)

func Connect()(*sql.DB,error){
	user :=os.Getenv("DB_USER")
	password :=os.Getenv("DB_PASSWORD")
	host :=os.Getenv("DB_HOST")
	port :=os.Getenv("DB_PORT")
	db_name :=os.Getenv("DB_NAME")

   dsn :=fmt.Sprintf(
	"%s:%s@tcp(%s:%s)/%s?parseTime=true",
	user,
	password,
	host,
	port,
	db_name,
   )
   db,err:=sql.Open("mysql",dsn)
   if err !=nil{
	return nil,err
   }
   err =db.Ping()
   if err !=nil{
	db.Close()
	return nil, err
   }
   db.SetMaxOpenConns(25)
   db.SetMaxIdleConns(10)

   return db,nil


}
