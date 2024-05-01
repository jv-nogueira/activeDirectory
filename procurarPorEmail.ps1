# Importar o módulo do Active Directory
Import-Module ActiveDirectory

# Substituir pelo NIF que deseja pesquisar
$userInfo = "renato.paula.3@sesisenaisp.org.br"

# Propriedades que vão ser filtradas
$Usuario = Get-ADUser -Filter {EmailAddress  -eq $userInfo} -Properties Office, SamAccountName, DisplayName, EmailAddress 

# Verificar se o usuário foi encontrado
if ($Usuario) {
    Write-Output "
    NIF: $($Usuario.SamAccountName)  
    Nome completo: $($Usuario.DisplayName)
    Unidade: $($Usuario.Office)
    E-mail: $($Usuario.EmailAddress)"
} else {
    Write-Output "Usuário não encontrado."
}

