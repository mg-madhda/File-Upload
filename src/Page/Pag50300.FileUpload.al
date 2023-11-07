page 50300 "File Upload"
{
    ApplicationArea = All;
    Caption = 'File Upload';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;

                field("File Upload"; Rec."File Upload")
                {
                    ToolTip = 'Specifies the value of the File Upload field.';
                    ShowCaption = false;
                    ApplicationArea = All;

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                begin
                    Clear(Rec."File Upload");
                    Rec.SetRange("No.", xRec."No.");
                    if UploadIntoStream('Select file', '', '', FileName, InS) then begin
                        TempBlob.CreateOutStream(OutS);
                        CopyStream(OutS, InS);
                        Rec.CalcFields("File Upload");
                        Rec."File Upload".CreateOutStream(OutS);
                        TempBlob.CreateInStream(InS);
                        CopyStream(OutS, InS);
                        Rec.Modify;
                        Message('Upload Success');
                    end;
                end;
            }

            action(DownloadPicture)
            {
                ApplicationArea = All;
                Caption = 'Export';
                Image = Export;
                ToolTip = 'Download the record.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("No.", xRec."No.");
                    If Rec."File Upload".HasValue then begin
                        Rec."File Upload".CreateInStream(InS);
                        TempFileName := 'Cust-' + Rec."No." + FileName;
                        DownloadFromStream(InS, 'Export', '', 'All Files(*.*)|(*.*)', TempFileName)
                    end
                    else
                        Error('Error');
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Image = Delete;
                ToolTip = 'Delete the record.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("No.", xRec."No.");
                    If Rec."File Upload".HasValue then begin
                        Rec.CalcFields("File Upload");
                        CLEAR(Rec."File Upload");
                        Rec.MODIFY;
                    end
                    else
                        Error('No File');
                end;
            }

        }
    }
    var
        HideActions: Boolean;
        TempBlob: Codeunit "Temp Blob";
        TempFileName: Text;
        InS: InStream;
        OutS: OutStream;
        FileName: Text;

}