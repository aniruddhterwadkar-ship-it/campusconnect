package main 
import(
	"fmt"
	"log"
    "github.com/joho/godotenv"
	"campusconnect/backend/database"

)

func main(){
	 err:=godotenv.Load()

	 if err !=nil{
		log.Fatal("error loading .env files",err)
	 }


	db,err:=database.Connect()
	if err !=nil{
		log.Fatal("Database connection failed :",err)
	}
	defer db.Close()
	fmt.Println("MYsql connected sucessfully")

}