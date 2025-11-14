Class App.InstallerFACTURE
{

XData setup
{
<Manifest>
  <Namespace Name="FACTURE" Code="FACTURE_SRC" Data="FACTURE_DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="FACTURE_DATA" Dir="/databases/FACTURE_DATA" Create="yes"  Resource="%DB_FACTURE_DATA"/>
      <Database Name="FACTURE_SRC" Dir="/databases/FACTURE_SRC" Create="yes"  Resource="%DB_FACTURE_SRC"/>
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
