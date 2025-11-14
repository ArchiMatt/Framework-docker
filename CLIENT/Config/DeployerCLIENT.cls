Class App.DeployerCLIENT
{

XData setup
{
<Manifest>
  <Default Name="SourceDir" Value="/opt/irisapp/code/CLIENT"/>

  <Namespace Name="CLIENT" Code="CLIENT_SRC" Data="CLIENT_DATA" Create="no" Ensemble="1">
    <Import File="${SourceDir}" Flags="ck" Recurse="1" IgnoreErrors="1"/>
    <Production Name="CLIENT.ProductionCLIENT"   AutoStart="1" />
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  do ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

}
