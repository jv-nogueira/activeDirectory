# Importar o módulo do Active Directory
Import-Module ActiveDirectory

# Substituir pelo NIF que deseja redefinir a senha
$userInfo = "SN76657"

# Gerar uma nova senha aleatória
$novaSenha = ConvertTo-SecureString -AsPlainText "Sesisenaisp@24" -Force

# Redefinir a senha do usuário
Set-ADAccountPassword -Identity $userInfo -NewPassword $novaSenha -Reset

# Definir a propriedade ChangePasswordAtLogon para que o usuário seja obrigado a mudar a senha na próxima vez que fizer login
Set-ADUser -Identity $userInfo -ChangePasswordAtLogon $true

# Propriedades que vão ser filtradas
$Usuario = Get-ADUser -Filter {SamAccountName  -eq $userInfo} -Properties DisplayName

# Mensagem de confirmação
Write-Output "Senha redefinida com sucesso para o usuário: $($Usuario.DisplayName)"
