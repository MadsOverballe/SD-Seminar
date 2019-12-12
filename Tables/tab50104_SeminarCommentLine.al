table 50104 "CSD Seminar Comment Line"
{
    DataClassification = AccountData;
    Caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";

    fields
    {
        field(10; "Table Name"; Option)
        {
            DataClassification = AccountData;
            OptionMembers = "Seminar","Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration,Posted Seminar Registration';
        }

        field(20; "Document Line No."; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Document Line No.';
        }

        field(30; "No."; Code[30])
        {
            DataClassification = AccountData;
            Caption = 'No.';
            TableRelation = if ("Table Name" = const(Seminar)) "CSD Seminar";
        }

        field(40; "Line No."; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Line No.';
        }

        field(50; Date; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date';
        }

        field(60; Code; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code';
        }

        field(70; Comment; Text[80])
        {
            DataClassification = AccountData;
            Caption = 'Comment';
        }
    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}