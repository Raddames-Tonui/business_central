page 50106 "Vehicle Management Role Center"
{
    ApplicationArea = All;
    Caption = 'Vehicle Management Role Center';
    PageType = RoleCenter;
    
    layout
    {
        area(RoleCenter)
        {
            part(Part1; "Headline RC Vehicle Manager")
            {
                ApplicationArea =  All;
            }
            // Add the cue CardPart page to the role center:
            part(Part2; "Vehicle Management RC Cue Card")
            {
                ApplicationArea =  All;
            }
        }


    }

    // Navigation Links - links to other pages
    actions
    {
        area(Sections)
        {
          group("Vehicle Types")  
          {
            Caption = 'Vehicle Types';
            Image = Setup;

            // Add a link to view the parent brands from the Vehicle Types list page using the RunPageView property.
            action(ViewParentBrands)
            {
                Caption = 'Vehicle Brands';
                RunObject = page "Vehicle Types";
                RunPageView = where("Parent No." = const(0));
            }

            action(ViewBrandsModels)
            {
                Caption = 'Brand Models';
                RunObject = page "Vehicle Types";
                RunPageView = where("Parent No." = filter(<> 0)); // any value not equal to zero.
            }
          }

          group("Vehicle Register")
          {
            Caption = 'Vehicle Register';
            Image = Setup;

            action(Vehicles)
            {
                Caption = 'List of Vehicles';
                RunObject = page "Vehicle Register";
            }
          }
        }

        area(Reporting)
        {
            action(VehicleBrandsReport)
            {
                caption = 'Vehicle Brands Report';
                Image = Report;
                RunObject = report "Vehicle Brands";
            }

            action(VehicleRegisterPerModelReport)
            {
                caption = 'Vehicle Register Per Model Report';
                Image = Report;
                RunObject = report "Vehicle Register Per Model";
            }
        }
    }
}

profile VehicleManagerProfile
{
    ProfileDescription = 'Vehicle Management Profile';
    RoleCenter = "Vehicle Management Role Center";
    Caption = 'Vehicle Management Role Center';
}

