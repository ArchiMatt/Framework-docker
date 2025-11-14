Class FACTURE.ProductionFACTURE Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="FACTURE.ProductionFACTURE" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="LocalJavaGateway" Category="ASMODEE" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Port">55599</Setting>
  </Item>
  <Item Name="JWT" Category="ASMODEE" ClassName="FACTURE.BO.JWT" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="ServiceSQL" Category="ASMODEE" ClassName="FACTURE.BS.ServiceSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">86400</Setting>
    <Setting Target="Adapter" Name="KeyFieldName"></Setting>
    <Setting Target="Adapter" Name="Query">SELECT 
LIST(ID) listeIdentifiant
FROM Ens.MessageHeader
group by MessageBodyClassName</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:IRIS://localhost:1972/FACTURE</Setting>
    <Setting Target="Adapter" Name="JGService">LocalJavaGateway</Setting>
    <Setting Target="Adapter" Name="Credentials">SuperUser</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.intersystems.jdbc.IRISDriver</Setting>
    <Setting Target="Host" Name="classeMessage">FACTURE.msg.gereListeIdentifiantDmde</Setting>
    <Setting Target="Host" Name="itemCible">JWT</Setting>
  </Item>
  <Item Name="X509Credentials" Category="" ClassName="FACTURE.BO.X509Credentials" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="PassthroughOperation" Category="" ClassName="EnsLib.FTP.PassthroughOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="TOTO" Category="" ClassName="Ens.Activity.Operation.REST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

