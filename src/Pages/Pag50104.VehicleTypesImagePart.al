   // CardPart pages are pages that are embedded within another page and 
    // are used to display additional information or actions relevant to the page.

page 50104 "Vehicle Types Image Part"
{
    ApplicationArea = All;
    Caption = 'Vehicle Types Image Part';
    PageType = CardPart;
    SourceTable = "Vehicle Types";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Logo/Image"; Rec."Logo/Image")
                {
                    ToolTip = 'Specifies the value of the Logo/Image field.', Comment = '%';
                }
            }
        }
    }
}
