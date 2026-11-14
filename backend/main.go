package main 
import(
	"fmt"
	"log"
    "github.com/joho/godotenv"
	"campusconnect/backend/database"
	"campusconnect/backend/repository"
	

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

	

	users,err:=repository.GetAllUsers(db)
	if err!=nil{
		log.Fatal(err)
	}
	for _,user := range users{
		fmt.Println("ID :",user.ID)
		fmt.Println("NAME :",user.Name)
		fmt.Println("Email :",user.Email)
		fmt.Println("Role :",user.Role)




	}

}