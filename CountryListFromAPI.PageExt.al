pageextension 50121 "CountryListFromAPI" extends "Country List"
{
    actions
    {
        addlast(Processing)
        {
            action("Improt Countries from API")
            {
                Caption = 'Import Countries from API';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    httpClient: HttpClient;
                    httpResponseMessage: HttpResponseMessage;
                    token: JsonToken;
                    response: Text;
                    array: JsonArray;
                    object: JsonObject;
                    countryRecord: Record Countries;
                    tokenName: JsonToken;
                    tokenCapital: JsonToken;
                    tokenCurrency: JsonToken;
                    tokenPopulation: JsonToken;
                    name: Text[100];
                    capital: Text[100];
                    currency: Text[50];
                    population: BigInteger;
                begin
                    httpClient.Get('https://freetestapi.com/api/v1/countries', httpResponseMessage);
                    if httpResponseMessage.IsSuccessStatusCode() then begin

                        httpResponseMessage.Content.ReadAs(response);
                        array.ReadFrom(response);

                        foreach token in array do begin
                            object := token.AsObject();

                            object.Get('name', tokenName);
                            name := tokenName.AsValue().AsText();
                            object.Get('capital', tokenCapital);
                            capital := tokenCapital.AsValue().AsText();
                            object.Get('currency', tokenCurrency);
                            currency := tokenCurrency.AsValue().AsText();
                            object.Get('population', tokenPopulation);
                            population := tokenPopulation.AsValue().AsBigInteger();

                            if not countryRecord.Get(name) then begin
                                countryRecord.Init();
                                countryRecord.Name := name;
                                countryRecord.Capital := capital;
                                countryRecord.Currency := currency;
                                countryRecord.Population := population;
                                countryRecord.Insert();
                            end else begin
                                countryRecord.Capital := capital;
                                countryRecord.Currency := currency;
                                countryRecord.Population := population;
                                countryRecord.Modify();
                            end;
                        end;
                    end;
                end;
            }
        }
    }
}