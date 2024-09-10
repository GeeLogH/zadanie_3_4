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
}