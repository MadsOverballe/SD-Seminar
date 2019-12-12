pageextension 50100 "CSD Resource Card Extension" extends "Resource Card"
// CSD1.00 - 2019-12-12 - D. E. Veloper
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {
                ApplicationArea = All;
            }

            field("CSD Quantity Per Day"; "CSD Quantitiy Per Day")
            {
                ApplicationArea = All;
            }
        }

        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField : Boolean;
}