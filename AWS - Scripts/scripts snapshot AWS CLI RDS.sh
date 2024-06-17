#!/bin/bash

# Parâmetros
source_db_instance_identifier="NOME_DO_SEU_RDS"
snapshot_identifier="NOME_DO_SNAPSHOT"
destination_account_id="ID_DA_CONTA_DESTINO"
aws_region="us-east-1" # Região Norte da Virgínia
kms_key_id="ARN_DA_CHAVE_KMS"
copied_snapshot_identifier="$snapshot_identifier-copia"

# Criar o snapshot
echo "Criando snapshot $snapshot_identifier do banco de dados $source_db_instance_identifier..."
aws rds create-db-snapshot --db-instance-identifier $source_db_instance_identifier --db-snapshot-identifier $snapshot_identifier

# Aguardar até que o snapshot seja criado
echo "Aguardando criação do snapshot..."
aws rds wait db-snapshot-completed --db-snapshot-identifier $snapshot_identifier

# Copiar o snapshot para a região e criptografá-lo com a chave KMS personalizada
echo "Copiando snapshot $snapshot_identifier para a região $aws_region e criptografando com a chave KMS personalizada $kms_key_id..."
aws rds copy-db-snapshot --source-db-snapshot-identifier $snapshot_identifier --target-db-snapshot-identifier $copied_snapshot_identifier --kms-key-id $kms_key_id

# Aguardar até que a cópia do snapshot esteja pronta
echo "Aguardando cópia do snapshot estar pronta..."
aws rds wait db-snapshot-completed --db-snapshot-identifier $copied_snapshot_identifier --region $aws_region

# Compartilhar o snapshot com a conta de destino
echo "Compartilhando o snapshot $copied_snapshot_identifier com a conta $destination_account_id..."
aws rds modify-db-snapshot-attribute --db-snapshot-identifier $copied_snapshot_identifier --attribute-name restore --values-to-add $destination_account_id --region $aws_region

echo "Snapshot $copied_snapshot_identifier compartilhado com sucesso com a conta $destination_account_id."




## Obs... é necessario criar uma chave do KMS personalizada para compartilhar entre contas o snapshot para mais informacoes verificar em ## https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/UserGuide/USER_ShareSnapshot.html#share-encrypted-snapshot