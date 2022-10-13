#!/bin/bash

declare qtd_usuarios=$(grep -o 'useradd' ./novos_usuarios.sh | wc -l)

echo "Serão adicionados $((qtd_usuarios - 1)) novos usuários..."
read -p "Deseja continuar? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "Inicializando criação de novos usuários."
echo "Pode tomar um café enquanto isso ;D"

echo "Criando diretórios..."

if [ ! -d "/publico-users" ] 
then
    mkdir /publico-users 
fi

if [ ! -d "/adm-users" ] 
then
    mkdir /adm-users 
fi

if [ ! -d "/colaboradores-users" ] 
then
    mkdir /colaboradores-users 
fi

if [ ! -d "/clientes-users" ] 
then
    mkdir /clientes-users 
fi


groupadd GRP_ADM
groupadd GRP_COLAB
groupadd GRP_CLIENTES

echo "Grupos criados..."

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_COLAB
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_COLAB
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_COLAB

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_CLIENTES
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_CLIENTES
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_CLIENTES

echo "Usuários criados..."

chown root:GRP_ADM /adm-users
chown root:GRP_ADM /colaboradores-users
chown root:GRP_ADM /clientes-users

chmod 770 /adm-users
chmod 770 /colaboradores-users
chmod 770 /clientes-users
chmod 770 /publico-users

echo "Permissões geradas..."
echo "Script executado com sucesso!"