table 50108 Countries
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Name"; Text[100])
        {
            Caption = 'Country Name';
            DataClassification = ToBeClassified;
        }
        field(2; "Capital"; Text[100])
        {
            Caption = 'Capital';
            DataClassification = ToBeClassified;
        }
        field(3; "Currency"; Text[50])
        {
            Caption = 'Currency';
            DataClassification = ToBeClassified;
        }
        field(4; "Population"; BigInteger)
        {
            Caption = 'Population';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Name")
        {
            Clustered = true;
        }
    }

    // fieldgroups
    // {
    //     // Add changes to field groups here
    // }

    // var
    //     myInt: Integer;

    // trigger OnInsert()
    // begin

    // end;

    // trigger OnModify()
    // begin

    // end;

    // trigger OnDelete()
    // begin

    // end;

    // trigger OnRename()
    // begin

    // end;

}
page 50109 "Country List"
{
    PageType = List;
    SourceTable = Countries;
    ApplicationArea = All;
    Caption = 'Country List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field("Capital"; Rec.Capital)
                {
                    ApplicationArea = All;
                }

                field("Currency"; Rec.Currency)
                {
                    ApplicationArea = All;
                }

                field("Population"; Rec.Population)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Add Country")
            {
                ApplicationArea = All;
                Caption = 'Add Country';
                Image = Add;

                trigger OnAction()
                begin
                    CurrPage.Editable := true;
                    CurrPage.SaveRecord();
                end;
            }
        }
    }
}