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