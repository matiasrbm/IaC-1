#!/bin/bash

echo "Iniciando provisionamento da infraestrutura..."

# 1. Remoção de estruturas anteriores
echo "Limpando estruturas anteriores..."
rm -rf /publico /adm /ven /sec

# Removendo usuários
userdel -r carlos 2>/dev/null
userdel -r maria 2>/dev/null
userdel -r joao_ 2>/dev/null
userdel -r debora 2>/dev/null
userdel -r sebastiana 2>/dev/null
userdel -r roberto 2>/dev/null
userdel -r josefina 2>/dev/null
userdel -r amanda 2>/dev/null
userdel -r rogerio 2>/dev/null

# Removendo grupos
groupdel GRP_ADM 2>/dev/null
groupdel GRP_VEN 2>/dev/null
groupdel GRP_SEC 2>/dev/null

# 2. Criação dos diretórios
echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

# 3. Criação dos grupos
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# 4. Criação dos usuários (método compatível)
echo "Criando usuários..."

# Função para criar usuários com senha
create_user() {
    local username=$1
    local comment=$2
    local group=$3
    
    useradd $username -c "$comment" -m -s /bin/bash -G $group
    echo "$username:Senha123" | chpasswd
}

# Usuários do grupo GRP_ADM
create_user carlos "Carlos" GRP_ADM
create_user maria "Maria" GRP_ADM
create_user joao_ "João" GRP_ADM

# Usuários do grupo GRP_VEN
create_user debora "Débora" GRP_VEN
create_user sebastiana "Sebastiana" GRP_VEN
create_user roberto "Roberto" GRP_VEN

# Usuários do grupo GRP_SEC
create_user josefina "Josefina" GRP_SEC
create_user amanda "Amanda" GRP_SEC
create_user rogerio "Rogério" GRP_SEC

# 5. Configuração das permissões
echo "Configurando permissões..."

# Permissões para o diretório público
chown root:root /publico
chmod 777 /publico

# Permissões para o diretório adm (GRP_ADM)
chown root:GRP_ADM /adm
chmod 770 /adm

# Permissões para o diretório ven (GRP_VEN)
chown root:GRP_VEN /ven
chmod 770 /ven

# Permissões para o diretório sec (GRP_SEC)
chown root:GRP_SEC /sec
chmod 770 /sec

echo "Provisionamento concluído!"
