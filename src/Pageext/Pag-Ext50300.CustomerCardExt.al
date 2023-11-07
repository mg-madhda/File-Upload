pageextension 50300 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("File Upload"; Rec."File Upload")
            {
                Caption = 'File Upload';
                // ApplicationArea = Basic, Suite;
                Editable = true;
                ApplicationArea = All;
                ShowCaption = false;
                Visible = false;
                ToolTip = 'Specifies the picture of the customer, for example, a logo.';
            }
        }
        addfirst(factboxes)
        {
            part(File_Upload; "File Upload")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
// actions
// {
//     addafter(Contact)
//     {

//         action(Import)
//         {
//             Caption = 'Import';
//             ApplicationArea = All;
//             Promoted = true;
//             PromotedCategory = Process;
//             PromotedIsBig = true;
//             PromotedOnly = true;
//             trigger OnAction()
//             var
//                 InS: InStream;
//                 OutS: OutStream;
//                 FileName: Text;
//             begin
//                 if UploadIntoStream('Select file', '', '', FileName, InS) then begin
//                     TempBlob.CreateOutStream(OutS);
//                     CopyStream(OutS, InS);
//                     Rec.CalcFields("File Upload");
//                     Rec."File Upload".CreateOutStream(OutS);
//                     TempBlob.CreateInStream(InS);
//                     CopyStream(OutS, InS);
//                 end;
//             end;
//         }
//     }
// }
// var
//     TempBlob: Codeunit "Temp Blob";
//     TempBlob2: Codeunit "Temp Blob List";
//     BLobList: Codeunit "Temp Blob List";
//     Persistent: Codeunit "Persistent Blob";