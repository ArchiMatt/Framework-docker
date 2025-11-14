Class CLIENT.msg.gereListeIdentifiantDmde Extends Ens.Request
{

Property listeIdentifiant As %String(MAXLEN = 50000);

Storage Default
{
<Data name="gereListeIdentifiantDmdeDefaultData">
<Subscript>"gereListeIdentifiantDmde"</Subscript>
<Value name="1">
<Value>listeIdentifiant</Value>
</Value>
</Data>
<DefaultData>gereListeIdentifiantDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
