# Projet FRAMEWORK pour la présentation à la communauté

**FRAMEWORK** est un projet qui permet de faire ses premiers pas avec DOCKER tout en parcourant les spécificités liés à la solution IRIS dans une architecture conteneurisée.

Pour cette formation vous avez besoin des outils suivants :

- Docker (Docker Desktop si vous êtes sur un environnement Windows) 
- VSCode avec toutes les extensions suivantes InterSystems : 
   - InterSystems Server Manager
   - InterSystems Object Script
   - InterSystems Language Server


# Dossiers 
## Dossier Install

Dans le dossier Install va se trouver tout ce qu'il faut pour créer le layer GLOBAL.
Le layer ne sera à créer qu'une seule fois au début.
Il devra être généré à nouveau à chaque création d'un nouveau namespace, ou modification de config (Ajout d'application web )


## Dossier Deploy

Dans le dossier Deploy va se trouver tout ce qu'il faut pour déployer l'environnement final.
Il va déployer :
- Les applications WEB
- Les paramètres par défaut
- Le code



# Installation pour la toute première fois

1. Création du volume spécifique 
    Créer un dossier sur votre ordinateur / serveur qui va héberger vos volumes

    Créer le volume avec la commande suivante (remplacer la valeur de device avec votre dossier fraichement créé):
    > docker volume create --driver local --label com.docker.compose.project=install --label com.docker.compose.version=1.29.1 --label com.docker.compose.volume=databases-framework-docker  --opt type=none --opt device=/Users/matthieu/work/docker/volumes/framework-docker --opt o=bind  databases-framework-docker


    Erreurs connues :

    - File not found :
        Lancer la commande en administrateur
    - Autres
        Si votre installation de WSL2 est toute neuve, merci de redémarrer. 

2. Build l'image générique :
    
    Aller à la racine du workspace et lancer la commande suivante : 
    > docker build --no-cache --progress=plain -t environnement-framework -f ./DOCKER/Install/Dockerfile .

    Cette image a pour but d'héberger les namespaces et leur installation. C'est une image possédant un InterSystems d'installer avec tous les namespaces vides.

    Cette image n'est à regénérer uniquement lorsqu'un nouveau namespace est créé.

3. Build l'image finale
    
    Aller dans le dossier Docker/Deploy et lancer la commande
    > docker compose build

    Dans docker, vous devriez voir 2 images
    - environnement-framework
    - framework

    environnement-framework correspond à l'image de base avec les namespaces vides.  
    framework correspond à l'image avec les namespaces déployés

    Cette image est à builder à chaque reconstruction d'un ou plusieurs namespaces.

    Les bases de données seront stockées en local dans le dossier que vous avez créé
    
4. Déployer le conteneur

    Dès lors que vous souhaitez déployer votre image, se rendre dans le dossier Deploy et lancer la commande
    > docker-compose up -d

    Cette commande va déployer l'image précédemment buildée dans un conteneur.
    Il est possible de faire le build en même temps que le déploiement avec
    > docker-compose up --build -d




# Stockage des BDD en local


Les BDD locales sont stockées dans 
> C:\docker\volumes\databases\formation-matthieu

Attention : Si ce dossier n'est pas vide, il viendra écraser les BDD du container au démarrage. Si vous supprimez une BDD, elle n'existera plus au démarrage du container même si ce dernier existe dans l'image déployée.