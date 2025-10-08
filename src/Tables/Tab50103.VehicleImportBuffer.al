table 50103 "Vehicle Import Buffer"
{
    Caption = 'Vehicle Import Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; BrandName; Text[100])
        {
            Caption = 'Brand Name';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; ParentNo; Integer)
        {
            Caption = 'Parent No.';
        }
    }

    keys
    {
        key(Key1; "Line No.") { }
    }
}
