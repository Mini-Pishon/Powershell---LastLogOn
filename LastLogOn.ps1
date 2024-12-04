# Récupérer la liste de tous les DC du domaine AD
$DCList = Get-ADDomainController -Filter * | Sort-Object Name | Select-Object Name

# Utilisateur ciblé (SamAccountName)
$TargetUser = "admin.fb"

# Initialiser le LastLogon sur $null comme point de départ
$TargetUserLastLogon = $null
    
Foreach($DC in $DCList){

        $DCName = $DC.Name
 
        Try {
            
            # Récupérer la valeur de l'attribut lastLogon à partir d'un DC (chaque DC tour à tour)
            $LastLogonDC = Get-ADUser -Identity $TargetUser -Properties lastLogon -Server $DCName

            # Convertir la valeur au format date/heure
            $LastLogon = [Datetime]::FromFileTime($LastLogonDC.lastLogon)

            # Si la valeur obtenue est plus récente que celle contenue dans $TargetUserLastLogon
            # la variable est actualisée : ceci assure d'avoir le lastLogon le plus récent à la fin du traitement
            If ($LastLogon -gt $TargetUserLastLogon)
            {
                $TargetUserLastLogon = $LastLogon
            }
 
            # Nettoyer la variable
            Clear-Variable LastLogon
            }

        Catch {
            Write-Host $_.Exception.Message -ForegroundColor Red
        }
}

Write-Host "Date de dernière connexion de $TargetUser :"
Write-Host $TargetUserLastLogon