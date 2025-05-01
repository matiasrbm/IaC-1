# Script de Provisionamento de Infraestrutura como Código (IaC)

![Infraestrutura como Código](https://img.shields.io/badge/IaC-Apache_Provisioning-blue)
![Shell Script](https://img.shields.io/badge/Shell_Script-Bash-green)

Este projeto implementa um script Bash para automação da criação de usuários, grupos, diretórios e permissões em sistemas Linux, seguindo os princípios de Infraestrutura como Código (IaC).

O script automatiza o provisionamento de:
- **Diretórios**: `/publico`, `/adm`, `/ven`, `/sec`
- **Grupos**: `GRP_ADM`, `GRP_VEN`, `GRP_SEC`
- **Usuários**: 9 usuários distribuídos nos grupos acima
- **Permissões**: Configurações específicas para cada diretório/grupo
