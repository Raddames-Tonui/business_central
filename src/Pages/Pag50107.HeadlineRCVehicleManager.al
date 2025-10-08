    page 50107 "Headline RC Vehicle Manager"
{
    ApplicationArea = All;
    Caption = 'Headline RC Vehicle Manager';
    PageType = HeadlinePart;
    
    layout
    {
        area(Content)
        {
            group(Control1)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;
                field(GreetingTeXt; RCHeadlinesPageCommon.GetGreetingText())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Greeting Headline';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::"Headline RC Vehicle Manager");
        UserGreetingVisible := RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;

    var
        UserGreetingVisible: Boolean;
        RcHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
}
