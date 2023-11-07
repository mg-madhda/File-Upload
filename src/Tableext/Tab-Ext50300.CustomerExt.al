tableextension 50300 "Customer Ext" extends Customer
{
    fields
    {
        field(50300; "File Upload"; Blob)
        {
            Caption = 'File Upload';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;

            // ObsoleteState = Removed;
            // ObsoleteTag = '19.0';
        }
    }


}
