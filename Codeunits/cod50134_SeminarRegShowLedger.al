codeunit 50134 "CSD Seminar Reg.-Show Ledger"
{
    TableNo = "CSD Seminar Register";

    trigger OnRun()
    begin
        SeminarLedgerEntry.SetRange("Entry No.", "From Entry No.", "To Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
}