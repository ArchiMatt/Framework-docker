Class FACTURE.BO.X509Credentials Extends EnsLib.REST.Operation
{

Method GetX509Credentials(pInput As Ens.Request, pOutput As Ens.Response) As %Status
{
   
        set pOutput = ##class(Ens.Response).%New()

        $$$TRACE("##class(%SYS.X509Credentials).Exists(MyCred)  : " _ ##class(%SYS.X509Credentials).Exists("MyCred") )
        set credset = ##class(%SYS.X509Credentials).GetByAlias("MyCred")

        $$$TRACE(credset.PrivateKey)
        return $$$OK
}

XData MessageMap
{
<MapItems>
 	
 	<MapItem MessageType="Ens.Request">
		<Method>GetX509Credentials</Method>
 	</MapItem>
</MapItems>
}

}
