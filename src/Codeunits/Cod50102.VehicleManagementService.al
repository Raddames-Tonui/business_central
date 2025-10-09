
codeunit 50102 "Vehicle Management Service"
{
    procedure CreateVehicleType(
        BrandName: Text;
        Description: Text;
        LogoImageB64: Text;
        ParentBrandNo: Integer
    ): Text
    var 
        NewVehicleType: Record "Vehicle Types";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        StoreImageRef: FieldRef;
        StoreRecRef: RecordRef;
    begin
        // Initialize the recorrd to be created
        NewVehicleType.Init();

        // Set the fields
        NewVehicleType."Brand Name" := BrandName;
        NewVehicleType."Description" := Description;

        // Set the parent brand if provided
        if ParentBrandNo <> 0 then begin
            NewVehicleType."Parent No." := ParentBrandNo;
        end;

        // Section to handle conversion of logo image from base64 text format to blob
            // Check if LogoImageB64 is not empty string/text
        if LogoImageB64 <> '' then begin
            /*
            TempBlob represents a temporary Blob (Binary Large Object) record.
            It's often used to store or manipulate large amounts of data,
            such as files or binary content,
            in memory without persisting them to the database.

            OutStr: A variable that will hold the output stream from the temporary blob
            */
            // 1. Initialize the OutStr variable. Creates an output stream from the temporary blob
            TempBlob.CreateOutStream(OutStr);

            /*
            LogoImageB64: A Text variable containing the Base64-encoded string.
            This represents the image/logo data encoded as Base64.

            OutStr: An OutStream variable where the decoded binary data will be written.
            */
            // 2. Decode the Base64-encoded string (LogoImageB64) and write the decoded binary data to the output stream.
            Base64Convert.FromBase64(LogoImageB64, OutStr);

            // 3. Reset/Empty the "Logo/Image" initial blob value
            Clear(NewVehicleType."Logo/Image");

            /*
            StoreRecRef: This is a variable of type RecordRef.

            A RecordRef allows you to work with any table in Business Central dynamically,
            without explicitly defining the table type at compile time.
            */

            // 4. The Open method is used to bind the RecordRef to table 50100 "Vehicle Types"
            StoreRecRef.Open(50100);

            /*
            StoreImageRef: A variable of type FieldRef.
            A FieldRef allows you to dynamically interact with a specific field in a RecordRef.

            NewVehicleType.FieldNo("Logo/Image"): The FieldNo method retrieves the numeric field ID for the "Logo/Image" field from the NewVehicleType record variable.

            StoreRecRef.Field(FieldID): The Field method retrieves a FieldRef object for the specified field ID from the RecordRef.
            */
            // 5. The FieldRef representing the "Logo/Image" field from StoreRecRef is assigned to StoreImageRef
            StoreImageRef := StoreRecRef.Field(NewVehicleType.FieldNo("Logo/Image"));

            // 6. Copy binary data of the image from the TempBlob record’s Blob field into the FieldRef (StoreImageRef).
            TempBlob.ToFieldRef(StoreImageRef);

            // 7. Check/Test if the FieldRef (StoreImageRef) has a Blob value. If empty an error will be thrown.
            StoreImageRef.TestField();

            // 8. Assign the Blob value from the FieldRef (StoreImageRef) to the "Logo/Image" Blob field
            NewVehicleType."Logo/Image" := StoreImageRef.Value;

            // 9. Check/Test if the Field ("Logo/Image") has a Blob value. If empty an error will be thrown.
            NewVehicleType.TestField("Logo/Image");
        end;
        NewVehicleType.Insert(true);

        exit('Vehicle Type has been created successfully');
    end;

}
