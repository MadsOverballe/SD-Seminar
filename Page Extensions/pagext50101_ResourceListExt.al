pageextension 50101 "CSD Resource List Extension" extends "Resource List"
// CSD1.00 - 2019-12-12 - D. E. Veloper
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }

        addafter(Type)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {
                ApplicationArea = All;
            }
            
            field("CSD Maximum Participants";"CSD Maximum Participants")
            {
                Visible = ShowMaxField;
                ApplicationArea = All;
            }
        }
    }
    
    trigger OnOpenPage();
    begin
        ShowType := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
    end;
    
    var
        [InDataSet]
        ShowType : Boolean;
        
        [InDataSet]
        ShowMaxField : Boolean;
}