page 50102 "Vehicle Types Card"
{
    ApplicationArea = All;
    Caption = 'Vehicle Types Card';
    PageType = Card;
    SourceTable = "Vehicle Types";
    
    layout
    {
        area(Content)
        {
            // Pages - Fast Tabs
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Parent No."; Rec."Parent No.")
                {
                    ToolTip = 'Specifies the value of the Parent No. field.', Comment = '%';
                }
                field("Parent Brand Name"; Rec."Parent Brand Name")
                {
                    ToolTip = 'Specifies the value of the Parent Brand Name field.', Comment = '%';
                }
                field("Brand Name"; Rec."Brand Name")
                {
                    ToolTip = 'Specifies the value of the Brand Name field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    MultiLine = true;
                }
                field("Logo/Image"; Rec."Logo/Image")
                {
                    ToolTip = 'Specifies the value of the Logo/Image field.', Comment = '%';
                }
                field("Registered Brand Names"; Rec."Registerd Brand Names")
                {
                    ToolTip = 'Specifies the number of brand names registered under this vehicle type.', Comment = '%';
                }
                field("Registered Vehicles";  Rec."Registered Vehicles")
                {
                    ToolTip = 'Specifies the number of vehicles registered under this vehicle type.', Comment = '%';
                }
            }

            // Pages - Fast Tabs - group of fields under a common heading
            group(Other)
            {
                Caption = 'Other Details';
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Updated By"; Rec."Updated By")
                {
                    ToolTip = 'Specifies the value of the Updated By field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }                
            }

            group(Register)
            {
                Caption = 'Vehicles Register';
                part("Vehicle Register List"; "Vehicle Register List Part")
                {
                    // Filter on the vehicles that are linked to the current vehicle type
                    SubPageLink = "Vehicle Type No." = field("No.");
                }
            }
        }


        // Adding a FactBox (CardPart) to display the Vehicle Types Image Part
        area(FactBoxes)
        {
            part("Images/Logo Section"; "Vehicle Types Image Part")
            {
                SubPageLink = "No." = field("No.");
            }
        }
    }

    // Pages - Actions - commands that can be executed from the page
    actions
    {
        area(Processing)
        {
            action("List fields data")
            {
                Caption = 'List fields data';
                Image = BulletList;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    Message(
                        '"Parent Brand Name": %1\"Brand Name": %2\"Description": %3\"Created By": %4\"Updated By": %5',
                        Rec."Parent Brand Name",
                        Rec."Brand Name",
                        Rec.Description,
                        Rec."Created By",
                        Rec."Updated By"
                    );
                end;
            }
        }

        // Navigation area for linking to related pages 
        // will display the list of registered vehicles filtered based on the current vehicle type.
        area(Navigation)
        {
            action("Vehicle Register")
            {
                Caption = 'Vehicle Register List';
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Report;

                RunObject = page "Vehicle Register";
                RunPageLink = "Vehicle Type No." = field("No.");
                RunPageMode = View;
            }
        }
    }

}
