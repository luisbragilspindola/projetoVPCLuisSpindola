# 🚀 AWS VPC & EC2 Automation Script

## 📌 Descrição
Este repositório contém um script Shell (`.sh`) que automatiza a criação de uma infraestrutura básica na AWS utilizando a AWS CLI. O script cria uma Virtual Private Cloud (VPC), sub-redes (públicas e privadas), um Internet Gateway, tabelas de rota e uma instância EC2.

## 📂 Estrutura do Script
O script está dividido nas seguintes etapas:

### 🏗️ Criação da VPC e Recursos Associados
- Cria uma **VPC** com o bloco CIDR `10.0.0.0/16`.
- Ativa a resolução de nomes DNS na VPC.
- Cria **sub-redes** pública e privada na zona de disponibilidade `us-east-1a`.
- Cria e anexa um **Internet Gateway** à VPC.
- Cria tabelas de rota e associa as sub-redes.
- Configura uma rota padrão para a sub-rede pública apontando para o Internet Gateway.

### 💻 Criação da Instância EC2
- Inicia uma instância EC2 baseada na AMI `ami-084568db4383264d4`.
- Define a instância como `t2.micro`.
- Configura o armazenamento EBS com 30GB no padrão `gp3`.
- Associa um IP público à instância.
- Define as tags para melhor organização.

## ⚙️ Requisitos
Para executar o script, você precisará de:
1. Uma conta AWS com permissões para criar VPCs e instâncias EC2.
2. AWS CLI instalada e configurada (`aws configure`).
3. Uma chave SSH cadastrada na AWS para acesso à instância.

## 🚀 Como Usar
1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/projetoLuisSpindola.git
   cd projetoLuisSpindola
   ```
2. Dê permissão de execução ao script:
   ```bash
   chmod +x deploy.sh
   ```
3. Execute o script:
   ```bash
   ./deploy.sh
   ```

## ⚠️ Observação
O script usa IDs de recursos fictícios (`preview-vpc-1234`, `preview-igw-1234`, etc.). Antes de executar, substitua-os pelos valores corretos para sua conta AWS.

---
**Autor:** Luis Spindola

