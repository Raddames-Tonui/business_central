namespace ALProject.ALProject;

xmlport 50102 "Vehicle Register"
{
    Caption = 'Vehicle Register';
    Format = VariableText;

    
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(VehicleRegister; "Vehicle Register")
            {
                fieldelement(VehicleTypeNo; VehicleRegister."Vehicle Type No.")
                {
                }
                fieldelement(RegistrationNo; VehicleRegister."Registration No.")
                {
                }
                fieldelement(VehicleTypeName; VehicleRegister."Vehicle Type Name")
                {
                }
                fieldelement(Description; VehicleRegister.Description)
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
