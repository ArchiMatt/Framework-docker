Class CLIENT.ProductionCLIENT Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="CLIENT.ProductionCLIENT" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="JWT" ClassName="CLIENT.BO.JWT" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="ServiceSQL" ClassName="CLIENT.BS.ServiceSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">86400</Setting>
    <Setting Target="Adapter" Name="KeyFieldName"></Setting>
    <Setting Target="Adapter" Name="Query">SELECT 
LIST(ID) listeIdentifiant
FROM Ens.MessageHeader
group by MessageBodyClassName</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:IRIS://localhost:1972/CLIENT</Setting>
    <Setting Target="Adapter" Name="JGService">LocalJavaGateway</Setting>
    <Setting Target="Adapter" Name="Credentials">SuperUser</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.intersystems.jdbc.IRISDriver</Setting>
    <Setting Target="Host" Name="classeMessage">CLIENT.msg.gereListeIdentifiantDmde</Setting>
    <Setting Target="Host" Name="itemCible">JWT</Setting>
  </Item>
  <Item Name="X509Credentials" Category="" ClassName="CLIENT.BO.X509Credentials" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="PassthroughOperation" Category="" ClassName="EnsLib.FTP.PassthroughOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
