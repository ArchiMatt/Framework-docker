Class FACTURE.BO.JWT Extends EnsLib.REST.Operation
{

Method GenerateTokenJWT(pInput As Ens.Request, pOutput As Ens.Response) As %Status
{
        // Importer les packages n�cessaires
        #Include %occInclude

        // D�finir les donn�es du payload
        s payload = "{"
        s payload = payload _   """iss"":""ISS"","
        s payload = payload _   """sub"":""SUB"","
        s payload = payload _   """aud"":""BONJOUR AUDIENCE"","
        s payload = payload _   """exp"":" _ $ZDT($H+1,-2) _ ","
        s payload = payload _   """iat"":" _ $ZDT($H,-2) _ ","
        s payload = payload _   """nbf"":" _ $ZDT($H,-2) _ ""
        s payload = payload _ "}"
        
        $$$TRACE(payload)
        // Encoder le header
        Set header = "{"
        Set header = header _  """alg"":""RS256"","
        Set header = header _  """typ"":""JWT"""
        Set header = header _  "}"
        
        Set headerBase64 = $$$BASE64URLENCODE(header)
        $$$TRACE(headerBase64)
        // Encoder le payload
        Set payloadBase64 = $$$BASE64URLENCODE(payload)
        $$$TRACE(payloadBase64)
        // Charger la cl� priv�e RSA depuis un fichier
        /*Set privateKeyFile = ##class(%File).%New("/tmp/jwt/PRIVATE_CONVERTED_KEY.pem")
        set sc = privateKeyFile.Open("R")
        set privateKey = ""
        while 'privateKeyFile.AtEnd {
            Set privateKey = privateKey_privateKeyFile.ReadLine()
        }*/

        ///LOADING THE FILE
        /*s f=##class(%Stream.FileBinary).%New()
        s f.Filename="/tmp/jwt/PRIVATE_KEY_RSA.pem"
        s privateKey=f.Read(100000)*/


        ///LOADING THE X509 Credential
        set credset = ##class(%SYS.X509Credentials).GetByAlias("LASTTRY")
        set privateKey = credset.PrivateKey


        $$$TRACE(privateKey)

        
        // Cr�er la signature en utilisant la cl� priv�e
        Set signature = ##class(%SYSTEM.Encryption).RSASHASign(256,headerBase64_"."_payloadBase64, privateKey,"")
        $$$TRACE("signature = " _ signature)
        Set signatureBase64 = $$$BASE64URLENCODE(signature)

        // Combiner les parties du JWT
        Set jwt = headerBase64_"."_payloadBase64_"."_signatureBase64

        $$$TRACE(jwt)
        return $$$OK
}

XData MessageMap
{
<MapItems>
 	
 	<MapItem MessageType="Ens.Request">
		<Method>GenerateTokenJWT</Method>
 	</MapItem>
</MapItems>
}

}
