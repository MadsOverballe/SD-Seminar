tableextension 50100 "CSD Resource Extension" extends Resource
// CSD1.00 - 2019-12-12 - D. E. Veloper
{
    fields
    {
        field(50101; "CSD Resource Type"; Option)
        {
            Caption = 'Resource Type';
            DataClassification = AccountData;
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
        }

        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Participants';
        }

        field(50103; "CSD Quantitiy Per Day"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantity Per Day';
        }

        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                TestField("Unit Cost");
            end;
        }

        modify(Type)
        {
            OptionCaption = 'Instructor,Room';
        }
    }
}