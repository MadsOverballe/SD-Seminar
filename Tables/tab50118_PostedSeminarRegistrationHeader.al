table 50118 "CSD Posted Seminar Reg. Header"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 1-3 & Lab 1-4
    //     - Created new table
    Caption = 'Posted Seminar Registration Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = AccountData;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = AccountData;
        }
        field(3; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = AccountData;
        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
            DataClassification = AccountData;
        }
        field(5; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            TableRelation = Resource where(Type = const(Person));
            DataClassification = AccountData;
        }
        field(6; "Instructor Name"; Text[50])
        {
            Caption = 'Instructor Name';
            CalcFormula = Lookup (Resource.Name where("No." = Field("Instructor Resource No."),
                                                     Type = const(Person)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Planning,Registration,Closed,Canceled';
            OptionMembers = Planning,Registration,Closed,Canceled;
            DataClassification = AccountData;
        }
        field(8; Duration; Decimal)
        {
            Caption = 'Duration';
            DecimalPlaces = 0 : 1;
            DataClassification = AccountData;
        }
        field(9; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = AccountData;
        }
        field(10; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = AccountData;
        }
        field(11; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            TableRelation = Resource where(Type = const(Machine));
            DataClassification = AccountData;
        }
        field(12; "Room Name"; Text[30])
        {
            Caption = 'Room Name';
            DataClassification = AccountData;
        }
        field(13; "Room Address"; Text[30])
        {
            Caption = 'Room Address';
            DataClassification = AccountData;
        }
        field(14; "Room Address 2"; Text[30])
        {
            Caption = 'Room Address 2';
            DataClassification = AccountData;
        }
        field(15; "Room Post Code"; Code[20])
        {
            Caption = 'Room Post Code';
            TableRelation = "Post Code".Code;
            ValidateTableRelation = false;
            DataClassification = AccountData;
        }
        field(16; "Room City"; Text[30])
        {
            Caption = 'Room City';
            DataClassification = AccountData;
        }
        field(17; "Room Country/Reg. Code"; Code[10])
        {
            Caption = 'Room Country/Reg. Code';
            TableRelation = "Country/Region";
            DataClassification = AccountData;
        }
        field(18; "Room County"; Text[30])
        {
            Caption = 'Room County';
            DataClassification = AccountData;
        }
        field(19; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
            DataClassification = AccountData;
        }
        field(20; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
            DataClassification = AccountData;
        }
        field(21; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
            DataClassification = AccountData;
        }
        field(22; Comment; Boolean)
        {
            Caption = 'Comment';
            CalcFormula = Exist ("CSD Seminar Comment Line" where("Table Name"=const("Posted Seminar Registration"),
                                                              "No."=Field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23;"Posting Date";Date)
        {
            Caption = 'Posting Date';
            DataClassification = AccountData;
        }

        field(24;"Document Date";Date)
        {
            Caption = 'Document Date';
            DataClassification = AccountData;
        }
        field(25;"Reason Code";Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code".Code;
            DataClassification = AccountData;
        }
        field(26;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series".Code;
            DataClassification = AccountData;
        }
        field(27;"Posting No. Series";Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series".Code;
            DataClassification = AccountData;
        }
        field(29; "User Id"; Code[50])
        {
            Caption = 'User Id';
            TableRelation = User;
            ValidateTableRelation = false;
            DataClassification = AccountData;
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(PK;"No.")
        {
        }
        key(Key2;"Room Resource No.")
        {
            SumIndexFields = Duration;
        }
    }
}

