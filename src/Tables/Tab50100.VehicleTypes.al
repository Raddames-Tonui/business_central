table 50100 "Vehicle Types"
{
    Caption = 'Vehicle Types';
    DataClassification = ToBeClassified;

    // Define the fields to be used as captions in the UI
    DataCaptionFields = "No.", "Brand Name";
    

    // ROLE CENTER CUES -> Role center cues allow us to present 
    // aggregated/summarised information on the role center page.
    // Link to the List page for lookup and drill-down scenarios
    LookupPageId = "Vehicle Types"; // List page
    DrillDownPageId = "Vehicle Types"; // List page
    

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Brand Name"; Text[50])
        {
            Caption = 'Brand Name';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Logo/Image"; Blob)
        {
            Caption = 'Logo/Image';
            Subtype = Bitmap;
        }
        field(5; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
        }
        field(6; "Updated By"; Code[50])
        {
            Caption = 'Updated By';
            Editable = false;
        }
        field(7; "Parent No."; Integer)
        {
            Caption = 'Parent No.';
            TableRelation = "Vehicle Types"."No." where ("Parent No." = const(0));
        }
        field(8; "Parent Brand Name"; Text[50])
        {
            Caption = 'Parent Brand Name';
            FieldClass = FlowField; // Read-only field that gets its value from a calculation
            CalcFormula = lookup("Vehicle Types"."Brand Name" where("No." = field("Parent No.")));
        }
        field(9; "Registerd Brand Names"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Types" where("Parent No."= field("No.")));
        }    
        field(10; "Registered Vehicles"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Register" where("Vehicle Type No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    // Optionally, you can define triggers, procedures, and functions here.
    // TABLE TRIGGERS
    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Updated By" := UserId;
    end;

    trigger OnModify()
    begin
        // Populate "Updated By" field with the current user
        "Updated By" := UserId;
    end;

    trigger OnDelete()
    var
        GlobalFunctions: Codeunit "Global Functions";
    begin
        GlobalFunctions.ConfirmRecordDeletion();
    end;
}
