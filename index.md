# TPE N°4: Apache, Vagrant et Ansible
### POLLAH YVES
### 21T2516

## Question 1

### Configuration de la VM avec Vagrant

Ce Vagrantfile crée une VM avec les spécifications suivantes :
- Image de base: "ubuntu/bionic64"
- CPU: 1, RAM: 512Mo
- Adresse IP: 192.168.53.10
- Hostname: web-server


## Question 2
### Installation et Configuration d'Apache2

Ce script bash installe Apache2, active le démarrage automatique et le démarre sur la machine virtuelle. Après 

## Question 3
### Configuration de l'Hôte Virtuel Apache

Ici ont configure un hôte virtuel Apache nommé l3-21t2516.cm avec les spécifications suivantes :
- Dossier du site :sudo mkdir $HOME/mon-site dans mon script

- Format de log :  LogFormat "%{%Y-%m-%d}t %{%H:%M:%S}t %U %a %{User-Agent}i %>s %m %v" customlog

1. **%{%Y-%m-%d}t** :
   - Correspond à la date au format YYYY-MM-DD.
   - {} indique le début et la fin d'une expression formatée de date/heure.
   - t spécifie que le format est pour une date/heure.

2. **%{%H:%M:%S}t** :
   - Correspond à l'heure au format HH:MM:SS.
   - Comme ci-dessus, {} est utilisé pour entourer l'expression formatée de date/heure.
   - t indique que le format est pour une date/heure.

3. **%U** :
   - Correspond à l'URL demandée par le client.
   - Cette directive enregistre l'URL de la requête HTTP.

4. **%a** :
   - Correspond à l'adresse IP du client.
   - Cette directive enregistre l'adresse IP du client.

5. **%{User-Agent}i** :
   - Correspond à l'en-tête User-Agent de la requête HTTP.
   - Cette directive enregistre les informations sur le navigateur et le système d'exploitation du client.

6. **%>s** :
   - Correspond au code de statut HTTP renvoyé par le serveur.
   - Cette directive enregistre le code de statut HTTP de la réponse.

7. **%m** :
   - Correspond à la méthode HTTP utilisée dans la requête.
   - Cette directive enregistre la méthode HTTP utilisée (GET, POST, etc.).

8. **%v** :
   - Correspond au nom d'hôte (nom virtuel) auquel la requête a été adressée.
   - Cette directive enregistre le nom d'hôte virtuel.

- Nom de domaine : l3-21t2516.cm
- Logs 
    ErrorLog $HOME/mon-site/mon-site-error.log
    CustomLog $HOME/mon-site/mon-site-access.log customlog
    tous ceci dans le fichier de configuration l3-21t2516.cm.conf

    `access.log enregistre des informations sur les requêtes HTTP et le trafic du site web, tandis que error.log enregistre des messages d'erreur et des avertissements sur le fonctionnement du serveur Apache.`

## Question 4
### Copie et Activation du Fichier de Configuration


1. Copie de la clé publique vers la machine virtuelle en utilisant ssh-copy-id.
2. Se connecter à la machine virtuelle via SSH : `ssh vagrant@192.168.53.10`.
3. Modifiez les droits des répertoires `sites-available` et `sites-enabled` pour donner les droits d'écriture aux autres utilisateurs.
4. se déconnecter de la machine virtuelle.
5. Copiez le fichier de configuration `l3-21t2516.cm.conf` vers le répertoire `/etc/apache2/sites-available/` de la machine virtuelle en utilisant la commande scp.

` scp l3-21t2516.cm.conf vagrant@192.168.53.10:/etc/apache2/sites-available/`

## Question 5
### Documentation de l'Infrastructure as Code avec Ansible

#### Fichier d'inventaire Ansible
- verifier son contenue dans mon code ( c'est le fichier `inventory.ini`)
#### Fichier du playbook
- verifier son contenue dans mon code ( c'est le fichier `playbook.yml`)
    `NB`: a note que c'est fichier la son bien commenter

## Question 6
### Documentation du Site Web

Mon site comporte deux pages :
1. Page 1 : Documentation structurée en Markdown de chaque question de ce projet. 
2. Page 2 : Logs d'accès du site.

## Question 7
 tout est dans mon Vagrantfile. jai ajouter ceci;
 ```
  config.vm.provision "ansible" do |ansible|
   
    ansible.playbook = "iac-ansible/playbook.yml"
    ansible.inventory_path = "iac-ansible/inventory.ini"
    
  end
  ```
## Question 8
   dans le repertoit /etc/hosts, jai ajouter ceci;
      `192.168.53.10 l3-21t2516.cm`

## Question 9.1 cas 1

l'Obtention d'un Certificat SSL pour un Site Web Déployé Localement avec Let's Encrypt et Certbot

### Introduction :

Dans le cadre de ce rapport, nous explorons le processus d'obtention d'un certificat SSL (Secure Sockets Layer) pour un site Web déployé localement. Le SSL est un protocole de sécurité crucial utilisé pour sécuriser les communications entre le navigateur d'un utilisateur et le serveur Web. Let's Encrypt est une autorité de certification qui fournit gratuitement des certificats SSL, tandis que Certbot est un outil qui automatise le processus de configuration et de renouvellement des certificats SSL.

### Objectif :

L'objectif principal de ce rapport est de documenter les étapes nécessaires pour obtenir un certificat SSL pour un site Web déployé localement, en mettant l'accent sur l'utilisation de Let's Encrypt et Certbot.

## Protocoles et Rôles :

1. **SSL (Secure Sockets Layer)** :
   Le SSL est un protocole de sécurité qui permet de créer un canal sécurisé entre le serveur Web et le navigateur de l'utilisateur. Il utilise un système de cryptage pour assurer la confidentialité et l'intégrité des données échangées.

2. **Let's Encrypt** :
   Let's Encrypt est une autorité de certification (CA) gratuite et automatisée, soutenue par l'Internet Security Research Group (ISRG). Elle fournit des certificats SSL/TLS gratuits pour permettre le chiffrement des communications sur Internet.

3. **Certbot** :
   Certbot est un logiciel open source qui automatise le processus d'obtention et de renouvellement des certificats SSL. Il est conçu pour fonctionner avec Let's Encrypt et prend en charge plusieurs serveurs Web, y compris Apache et Nginx.

## Étapes pour Obtenir un Certificat SSL avec Certbot :

I. **Installation de Certbot et python3-certbot-apache** :
   Avant de commencer le processus, assurez-vous que Certbot est installé sur votre système. Vous pouvez l'installer en utilisant les gestionnaires de paquets appropriés ou en suivant les instructions sur le site officiel de Certbot.
  
   ### Installation de Certbot et python3-certbot-apache sur Ubuntu(VM)
   sudo apt-get update
   sudo apt-get install certbot python3-certbot-apache

`python3-certbot-apache:` Ce package est un plugin pour Certbot qui facilite la configuration des certificats SSL pour les serveurs Apache. Il permet à Certbot de communiquer avec Apache pour configurer automatiquement les certificats SSL et mettre à jour la configuration d'Apache pour utiliser HTTPS.

Dans cette étape, nous allons nous assurer que notre pare-feu est configuré pour permettre le trafic nécessaire et qu'il est activé pour filtrer les accès de manière appropriée. Voici les étapes à suivre :

II. **Vérification du Pare-feu** :

Dans cette étape, nous allons nous assurer que notre pare-feu est configuré pour permettre le trafic nécessaire et qu'il est activé pour filtrer les accès de manière appropriée. Voici les étapes à suivre :

### 1. Vérifier les Règles du Pare-feu

Nous devons vérifier que les règles du pare-feu permettent le trafic pour SSH, Apache (HTTP), et Apache sécurisé (HTTPS). Utilisons `ufw` (Uncomplicated Firewall) pour gérer le pare-feu sur un système basé sur Debian/Ubuntu.

### 2. Activer les Profils d'Application

Les profils `ufw` pour Apache sont souvent préconfigurés. Voici comment activer ces profils :

- **SSH :** Pour permettre les connexions SSH, nous devons nous assurer que le trafic SSH est autorisé.
- **Apache :** Pour permettre le trafic HTTP (port 80).
- **Apache Secure :** Pour permettre le trafic HTTPS (port 443).
- **Apache Full :** Ce profil inclut les deux règles pour Apache HTTP et HTTPS.

Utilisez les commandes suivantes pour activer ces profils :

```bash
sudo ufw allow 'OpenSSH'
sudo ufw allow 'Apache'
sudo ufw allow 'Apache Secure'
sudo ufw allow 'Apache Full'
```

### 3.Activer le Pare-feu :
Après avoir configuré les règles, nous devons nous assurer que le pare-feu est activé. Activez ufw avec la commande suivante :


`sudo ufw enable`

### 4. Vérifier le Statut du Pare-feu :
Enfin, vérifiez que les règles sont appliquées correctement et que le pare-feu est actif :

    `sudo ufw status`

**Voici une description détaillée de chaque commande** :
```bash
    sudo ufw allow 'OpenSSH' : Autorise les connexions SSH pour gérer le serveur à distance de manière sécurisée.
    sudo ufw allow 'Apache' : Autorise le trafic HTTP sur le port 80, permettant ainsi l'accès aux sites Web non sécurisés.
    sudo ufw allow 'Apache Secure' : Autorise le trafic HTTPS sur le port 443, permettant ainsi l'accès aux sites Web sécurisés.
    sudo ufw allow 'Apache Full' : Active les règles pour HTTP et HTTPS, assurant que le trafic pour les deux types de connexions est autorisé.
    sudo ufw enable : Active le pare-feu ufw, appliquant ainsi toutes les règles configurées.
    sudo ufw status : Affiche l'état actuel du pare-feu et les règles actives, permettant de vérifier que tout est correctement configuré.
```
En suivant ces étapes, nous nous assurons que le pare-feu est correctement configuré pour autoriser le trafic nécessaire tout en filtrant les accès non autorisés, renforçant ainsi la sécurité de notre serveur.



III. **Exécution de Certbot avec le Plugin Apache**

Utilisez la commande suivante pour obtenir et installer un certificat SSL pour votre domaine en utilisant le plugin Apache de Certbot :

`sudo certbot --apache`

Cette commande configure automatiquement votre serveur Apache pour utiliser le certificat SSL et met à jour votre configuration Apache pour activer HTTPS.
 -Suivi des Instructions Interactives de Certbot

Certbot vous guidera à travers un processus interactif pour obtenir et installer le certificat SSL. Fournissez les informations requises, telles qu'une adresse e-mail pour les notifications. Vous devrez également accepter les termes du service de Let's Encrypt et choisir si vous voulez rediriger tout le trafic HTTP vers HTTPS.
-verification si le service certbot tourne avec la comande
   `sudo systemctl status certbot.timer`
-Vérification et Configuration du Certificat SSL

Une fois que Certbot a terminé avec succès, vérifiez que votre site est accessible via HTTPS. Pour cela, ouvrez un navigateur Web et accédez à votre domaine en utilisant https://l3-21t2516.cm.

IV. **renouvellement des certificats SSL/TLS**


La commande `sudo certbot renew --dry-run` est utilisée pour tester le processus de renouvellement des certificats SSL/TLS gérés par Certbot sans effectuer de modifications réelles sur le système.

### Décomposition de la Commande

- **`renew`** : Indique à Certbot de renouveler les certificats proches de leur date d'expiration.
- **`--dry-run`** : Exécute un test de renouvellement sans faire de modifications réelles.

### Pourquoi Utiliser `--dry-run` ?

- **Validation du Processus** : Vérifie que le processus de renouvellement fonctionne correctement.
- **Détection de Problèmes** : Permet de corriger les erreurs avant que les certificats n'expirent réellement.
- **Tranquillité d'Esprit** : Assure aux administrateurs système que le renouvellement fonctionnera comme prévu.


## Question 9.2 cas 2

l'Obtention d'un Certificat SSL pour un Site Web Déployé Localement avec Let's Encrypt et Certbot

### Introduction :

Dans le cadre de ce rapport, nous explorons le processus d'obtention d'un certificat SSL (Secure Sockets Layer) pour un site Web déployé localement. Le SSL est un protocole de sécurité crucial utilisé pour sécuriser les communications entre le navigateur d'un utilisateur et le serveur Web. Let's Encrypt est une autorité de certification qui fournit gratuitement des certificats SSL, tandis que Certbot est un outil qui automatise le processus de configuration et de renouvellement des certificats SSL.

### Objectif :

L'objectif principal de ce rapport est de documenter les étapes nécessaires pour obtenir un certificat SSL pour un site Web déployé localement, en mettant l'accent sur l'utilisation de Let's Encrypt et Certbot.

## Protocoles et Rôles :

1. **SSL (Secure Sockets Layer)** :
   Le SSL est un protocole de sécurité qui permet de créer un canal sécurisé entre le serveur Web et le navigateur de l'utilisateur. Il utilise un système de cryptage pour assurer la confidentialité et l'intégrité des données échangées.

2. **Let's Encrypt** :
   Let's Encrypt est une autorité de certification (CA) gratuite et automatisée, soutenue par l'Internet Security Research Group (ISRG). Elle fournit des certificats SSL/TLS gratuits pour permettre le chiffrement des communications sur Internet.

3. **Certbot** :
   Certbot est un logiciel open source qui automatise le processus d'obtention et de renouvellement des certificats SSL. Il est conçu pour fonctionner avec Let's Encrypt et prend en charge plusieurs serveurs Web, y compris Apache et Nginx.

## Étapes pour Obtenir un Certificat SSL avec Certbot :

I. **Installation de Certbot et python3-certbot-apache** :
   Avant de commencer le processus, assurez-vous que Certbot est installé sur votre système. Vous pouvez l'installer en utilisant les gestionnaires de paquets appropriés ou en suivant les instructions sur le site officiel de Certbot.
  
   ### Installation de Certbot et python3-certbot-apache sur Ubuntu(VM)
   sudo apt-get update
   sudo apt-get install certbot python3-certbot-apache

`python3-certbot-apache:` Ce package est un plugin pour Certbot qui facilite la configuration des certificats SSL pour les serveurs Apache. Il permet à Certbot de communiquer avec Apache pour configurer automatiquement les certificats SSL et mettre à jour la configuration d'Apache pour utiliser HTTPS.

Dans cette étape, nous allons nous assurer que notre pare-feu est configuré pour permettre le trafic nécessaire et qu'il est activé pour filtrer les accès de manière appropriée. Voici les étapes à suivre :

II. **Vérification du Pare-feu** :

Dans cette étape, nous allons nous assurer que notre pare-feu est configuré pour permettre le trafic nécessaire et qu'il est activé pour filtrer les accès de manière appropriée. Voici les étapes à suivre :

### 1. Vérifier les Règles du Pare-feu

Nous devons vérifier que les règles du pare-feu permettent le trafic pour SSH, Apache (HTTP), et Apache sécurisé (HTTPS). Utilisons `ufw` (Uncomplicated Firewall) pour gérer le pare-feu sur un système basé sur Debian/Ubuntu.

### 2. Activer les Profils d'Application

Les profils `ufw` pour Apache sont souvent préconfigurés. Voici comment activer ces profils :

- **SSH :** Pour permettre les connexions SSH, nous devons nous assurer que le trafic SSH est autorisé.
- **Apache :** Pour permettre le trafic HTTP (port 80).
- **Apache Secure :** Pour permettre le trafic HTTPS (port 443).
- **Apache Full :** Ce profil inclut les deux règles pour Apache HTTP et HTTPS.

Utilisez les commandes suivantes pour activer ces profils :

```bash
sudo ufw allow 'OpenSSH'
sudo ufw allow 'Apache'
sudo ufw allow 'Apache Secure'
sudo ufw allow 'Apache Full'
```

### 3.Activer le Pare-feu :
Après avoir configuré les règles, nous devons nous assurer que le pare-feu est activé. Activez ufw avec la commande suivante :


`sudo ufw enable`

### 4. Vérifier le Statut du Pare-feu :
Enfin, vérifiez que les règles sont appliquées correctement et que le pare-feu est actif :

    `sudo ufw status`

**Voici une description détaillée de chaque commande** :
```bash
    sudo ufw allow 'OpenSSH' : Autorise les connexions SSH pour gérer le serveur à distance de manière sécurisée.
    sudo ufw allow 'Apache' : Autorise le trafic HTTP sur le port 80, permettant ainsi l'accès aux sites Web non sécurisés.
    sudo ufw allow 'Apache Secure' : Autorise le trafic HTTPS sur le port 443, permettant ainsi l'accès aux sites Web sécurisés.
    sudo ufw allow 'Apache Full' : Active les règles pour HTTP et HTTPS, assurant que le trafic pour les deux types de connexions est autorisé.
    sudo ufw enable : Active le pare-feu ufw, appliquant ainsi toutes les règles configurées.
    sudo ufw status : Affiche l'état actuel du pare-feu et les règles actives, permettant de vérifier que tout est correctement configuré.
```
En suivant ces étapes, nous nous assurons que le pare-feu est correctement configuré pour autoriser le trafic nécessaire tout en filtrant les accès non autorisés, renforçant ainsi la sécurité de notre serveur.



III. **Exécution de Certbot avec le Plugin Apache**

Utilisez la commande suivante pour obtenir et installer un certificat SSL pour votre domaine en utilisant le plugin Apache de Certbot :

`sudo certbot --apache`

Cette commande configure automatiquement votre serveur Apache pour utiliser le certificat SSL et met à jour votre configuration Apache pour activer HTTPS.
 -Suivi des Instructions Interactives de Certbot

Certbot vous guidera à travers un processus interactif pour obtenir et installer le certificat SSL. Fournissez les informations requises, telles qu'une adresse e-mail pour les notifications. Vous devrez également accepter les termes du service de Let's Encrypt et choisir si vous voulez rediriger tout le trafic HTTP vers HTTPS.
-verification si le service certbot tourne avec la comande
   `sudo systemctl status certbot.timer`
-Vérification et Configuration du Certificat SSL

Une fois que Certbot a terminé avec succès, vérifiez que votre site est accessible via HTTPS. Pour cela, ouvrez un navigateur Web et accédez à votre domaine en utilisant https://kamergaz.life.

IV. **renouvellement des certificats SSL/TLS**


La commande `sudo certbot renew --dry-run` est utilisée pour tester le processus de renouvellement des certificats SSL/TLS gérés par Certbot sans effectuer de modifications réelles sur le système.

### Décomposition de la Commande

- **`renew`** : Indique à Certbot de renouveler les certificats proches de leur date d'expiration.
- **`--dry-run`** : Exécute un test de renouvellement sans faire de modifications réelles.

### Pourquoi Utiliser `--dry-run` ?

- **Validation du Processus** : Vérifie que le processus de renouvellement fonctionne correctement.
- **Détection de Problèmes** : Permet de corriger les erreurs avant que les certificats n'expirent réellement.
- **Tranquillité d'Esprit** : Assure aux administrateurs système que le renouvellement fonctionnera comme prévu.


## question 9.3 

### Configuration pour que le Site Réponde Automatiquement en HTTPS

Lorsque vous configurez votre site Web pour répondre automatiquement en HTTPS, vous vous assurez que toutes les connexions vers votre site sont sécurisées par défaut, ce qui renforce la confidentialité et la sécurité des données échangées entre le serveur et les utilisateurs.

Voici les étapes à suivre pour configurer votre site Web afin qu'il réponde automatiquement en HTTPS :

## 1. Installation du Certificat SSL

Assurez-vous d'avoir un certificat SSL valide installé sur votre serveur. Vous pouvez utiliser Certbot pour obtenir et installer un certificat SSL gratuitement à partir de Let's Encrypt. Exécutez la commande suivante pour obtenir un certificat SSL pour votre domaine :


`sudo certbot --apache`

Suivez les instructions interactives pour obtenir et installer le certificat SSL.
2. **Configuration de la Redirection HTTPS**

Après avoir installé le certificat SSL, vous devez configurer votre serveur Web pour rediriger automatiquement toutes les connexions HTTP vers HTTPS. Voici comment le faire pour Apache :
a. ```Ouvrez le Fichier de Configuration d'Apache```


`sudo nano /etc/apache2/sites-available/000-default.conf`

b. ```Ajoutez une Règle de Redirection```

Ajoutez la règle suivante à l'intérieur du bloc <VirtualHost> pour votre domaine, juste avant la balise </VirtualHost> :

apache

<VirtualHost *:80>
    ...
    Redirect permanent / https://votre_domaine.com/
    ...
</VirtualHost>

Assurez-vous de remplacer votre_domaine.com par votre propre domaine.
c. ```Enregistrez et Fermez le Fichier```

Enregistrez les modifications que vous avez apportées au fichier de configuration et fermez l'éditeur.
d. ```Redémarrez Apache```

Après avoir modifié le fichier de configuration, redémarrez le serveur Apache pour que les modifications prennent effet :


`sudo systemctl restart apache2`

3. ```Vérification de la Configuration```

Pour vérifier que votre site Web répond désormais automatiquement en HTTPS, ouvrez un navigateur Web et accédez à votre domaine en utilisant http://votre_domaine.com. Vous devriez être automatiquement redirigé vers https://l3-21t2516.cm.


# Environnement de production

Ip du serveur : 144.126.152.251

nom de domaine. kamergaz.life