report 50101 "Vehicle Register Per Model"
{
    ApplicationArea = All;
    Caption = 'Vehicle Register Per Model';
    UsageCategory = ReportsAndAnalysis;

    RDLCLayout = 'Rep50101.VehicleRegisterPerModel.rdl';
    
    dataset
    {
        dataitem(VehicleRegister; "Vehicle Register")
        {
            // This will prompt the user to be requested for the vehicle model type before running the report.
            RequestFilterFields = "Vehicle Type No.";

            column(VehicleRegisterTypeNo; "Vehicle Type No.")
            {
            }
            column(VehicleRegisterDescription; Description)
            {
            }
            column(VehicleRegisterRegNo; "Registration No.")
            {
            }
            column(VehicleRegisterCreatedBy; "Created By")
            {
            }
            column(VehicleRegisterCreatedAt; SystemCreatedAt)
            {
            }
            column(VehicleRegisterUpdatedBy; "Updated By")
            {
            }
            column(VehicleRegisterUpdatedAt; SystemModifiedAt)
            {
            }

            dataitem(VehicleTypes; "Vehicle Types")
            {
                DataItemLink = "No." = field("Vehicle Type No.");
                column(No; "No.")
                {                    
                }
                column(BrandName; "Brand Name")
                {                    
                }
                column(Description; Description)
                {                    
                }
                column(LogoImage; "Logo/Image")
                {                    
                }
                column(ParentBrandName;"Parent Brand Name")
                {                    
                }
                column(RegisteredVehicles;"Registered Vehicles")
                {
                }
            }

        }
    }
    requestpage
    {
        // This will ensure the report filter modal page is not closed after previewing and closing the report.
        SaveValues = true;
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
