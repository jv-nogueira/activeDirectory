# Importar o módulo do Active Directory
Import-Module ActiveDirectory

# Substituir pelo nome de usuário completo que deseja pesquisar
$userInfo = "marcelo.garcia@sesisp.org.br"

# Propriedades que vão ser filtradas
$Usuarios = Get-ADUser -Filter {DisplayName -eq $userInfo -or EmailAddress -eq $userInfo -or SamAccountName -eq $userInfo} -Properties Office, SamAccountName, DisplayName, EmailAddress 

# Verificar se o usuário foi encontrado
if ($Usuarios) {
    foreach ($Usuario in $Usuarios) {
     Write-Output ""
        Write-Output @"
    NIF: $($Usuario.SamAccountName)  
    Nome completo: $($Usuario.DisplayName)
    Unidade: $($Usuario.Office)
    E-mail: $($Usuario.EmailAddress)
"@
    }
} else {
    Write-Output "Usuário não encontrado."
}
