Class FACTURE.BS.ServiceSQL Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Property classeMessage As %String;

Property itemCible As %String;

Parameter SETTINGS = "classeMessage,itemCible";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, pOutput As %RegisteredObject) As %Status
{
    $$$TRACE(pInput.ColCount)
    set req=$CLASSMETHOD(..classeMessage,"%New")
    // Pour chaque ligne, parcourir les champs
    For i = 1:1:pInput.ColCount {
        Set fieldName = pInput.%GetData(i)
        Set fieldValue = pInput.GetColumnLabelName(i)
        $$$TRACE(fieldName)
        $$$TRACE(fieldValue)
        s $PROPERTY(req,pInput.GetColumnLabelName(i)) = pInput.%GetData(i)
    }

    set sc= ..SendRequestSync(..itemCible,req,.pOutput)
    Quit $$$OK
}

}
