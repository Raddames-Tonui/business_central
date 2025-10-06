page 50103 "Vehicle Register Card"
{
    ApplicationArea = All;
    Caption = 'Vehicle Register Card';
    PageType = Card;
    SourceTable = "Vehicle Register";

    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Vehicle Type Name"; Rec."Vehicle Type Name")
                {
                    ToolTip = 'Specifies the value of the Vehicle Type Name field.', Comment = '%';
                }
                field("Vehicle Type No."; Rec."Vehicle Type No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Type No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    MultiLine = true;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ToolTip = 'Specifies the value of the Registration No. field.', Comment = '%';
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
        }
    
        // Adding a FactBox (CardPart) to display the Vehicle Types Image Part
        area(FactBoxes)
        {
            part("Vehicle Type Image"; "Vehicle Types Image Part")
            {
                // Filter on the image that is related to the current vehicle type
                SubPageLink = "No." = field("Vehicle Type No.");
            }
        }
    }
}
