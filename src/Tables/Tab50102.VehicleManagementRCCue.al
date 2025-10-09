table 50102 "Vehicle Management RC Cue"
{
    Caption = 'Vehicle Management RC Cue';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Cue No."; Integer)
        {
            Caption = 'Cue No.';
        }
        field(2; "Number Of Parent Brands"; Integer)
        {
            Caption = 'Number Of Parent Brands';
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Types" where("Parent No." = const(0)));
        }
        field(3; "Number of Vehicle Models"; Integer)
        {
            Caption = 'Number of Vehicle Models';
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Types" where("Parent No." = filter(<> 0 )));
        }
        field(4; "Total Registered Vehicles"; Integer)
        {
            Caption = 'Total Registered Vehicles';
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Register");
        }
    }
    keys
    {
        key(PK; "Cue No.")
        {
            Clustered = true;
        }
    }
}
