tableextension 50101 "CSD Source Code Setup Ext" extends "Source Code Setup"
// CSD1.00 - 2012-06-15 - D. E. Veloper 
// Chapter 7 - Lab 1-7 
// - Added new fields: 
// - Seminar
{
    fields
    {
        field(50100; "CSD Seminar"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }

    var
        myInt: Integer;
}