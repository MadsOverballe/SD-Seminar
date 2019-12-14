tableextension 50104 "CSD Resource Journal Line Ext" extends "Res. Journal Line"
{
    fields
    {
        field(50100; "CSD Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = AccountData;
        }

        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            Caption = 'Semianr Registration No.';
            TableRelation = "CSD Seminar Reg. Header";
            DataClassification = AccountData;
        }
    }
}