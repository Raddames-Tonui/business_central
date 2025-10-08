xmlport 50102 "Vehicle Brand Models Excel"
{
    Caption = 'Vehicle Brand Models Excel';
    Format = Excel;
    
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(VehicleTypes; "Vehicle Types")
            {
                fieldelement(BrandName; VehicleTypes."Brand Name")
                {
                }
                fieldelement(Description; VehicleTypes.Description)
                {
                }
                fieldelement(ParentNo; VehicleTypes."Parent No.")
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
