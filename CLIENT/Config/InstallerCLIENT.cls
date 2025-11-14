Class App.InstallerCLIENT
{

XData setup
{
<Manifest>
  <Namespace Name="CLIENT" Code="CLIENT_SRC" Data="CLIENT_DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="CLIENT_DATA" Dir="/databases/CLIENT_DATA" Create="yes"  Resource="%DB_CLIENT_DATA"/>
      <Database Name="CLIENT_SRC" Dir="/databases/CLIENT_SRC" Create="yes"  Resource="%DB_CLIENT_SRC"/>
    </Configuration>
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  do ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

}
