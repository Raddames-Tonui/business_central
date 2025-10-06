codeunit 50101 "Calculator Service"
{
    procedure Addition(Number1: Integer; Number2: Integer): Integer
    begin
        exit(Number1 + Number2);
    end;

    procedure Subtraction(Number1: Integer; Number2: Integer): Integer
    begin
        exit(Number1 - Number2);
    end;

    procedure Multiplication(Number1: Integer; Number2: Integer): Integer
    begin
        exit(Number1 * Number2);
    end;

    procedure Division(Number1: Integer; Number2: Integer): Integer
    begin
        exit(Number1 / Number2);
    end;
}

// Check on Web Services in Business Central to see the service and the SOAP endpoint URL.
// The XML response is called WSDL (Web Services Description Language) and it is used to describe the services offered by the given SOAP url.