codeunit 50139 "CSD Event Subscriptions"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Res. Jnl.-Post Line", 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeREsLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line")
    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateFindRecords(var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;
    begin
        if PostedSeminarRegHeader.ReadPermission then begin
            PostedSeminarRegHeader.Reset;
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.Count;
            with DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := COPYSTR(PostedSeminarRegHeader.TableCaption, 1, MAXSTRLEN("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert();
            end;
        end;

        if SeminarLedgerEntry.ReadPermission then begin
            SeminarLedgerEntry.Reset;
            SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            SeminarLedgerEntry.SetCurrentKey("Document No.");
            DocNoOfRecords := SeminarLedgerEntry.Count;
            with DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Seminar Ledger Entry";
                "Document Type" := 0;
                "Table Name" := COPYSTR(SeminarLedgerEntry.TableCaption, 1, MAXSTRLEN("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean)
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
    begin
        case TableID of
            Database::"CSD Posted Seminar Reg. Header":
                begin
                    PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
                    PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
                    Page.Run(0, PostedSeminarRegHeader);
                end;
            Database::"CSD Seminar Ledger Entry":
                begin
                    SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
                    SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
                    Page.Run(0, SeminarLedgerEntry);
                end;
        end;
    end;
}