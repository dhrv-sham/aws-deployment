# while creating a lamda fucntion it is neccasssary to have a handler function and import files as well
import json

# lamda _handler fucntion is the main function which is called by the lamda function
def lambda_handler(event,context) :
    print("Hello Lamda")
    return {
        "statusCode": 200,
        "body": json.dumps("Hello from Lamda!")
    }