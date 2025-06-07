# dépendances
- live-build pour construire le live https://salsa.debian.org/live-team/live-build
- apt-cacher-ng (pour éviter de télécharger les paquets à chaque construction)

# principe de base
live-build permet de créer un live Debian personnalisé.
il utilise debootstrap pour générer un système de base dans lequel il se chroot afin
d'installer tout ce qu'il faut (les paquets listés).
il intègre ensuite la personnalisation (/config/includes.chroot) dans le chroot.
une fois fait, il compresse le tout dans un fichier squashfs.filesystem qui sera
décompressé lors du lancement du live. il ajoute un lanceur et un installeur,
tout ceci formant l'ISO distribuée au final.

# contenu du projet
le script mkbento lance les commandes nécessaires pour configurer le live (lb config),
pour le construire (lb build) puis le renommer.

la configuration principale se trouve dans /auto/config (man lb config pour les options)

le dossier /config intègre les configuration pour la personnalisation :
- hook : les scripts réalisés dans le système chrooté juste avant la compression en squashfs
- includes.binary : ce qui sera intégré dans le livecd, à la racine de l'ISO
- includes.chroot : ce qui sera intégré dans le système live
- includes.installer : ce qui sera intégré dans l'installeur
- package-lists : la ou les listes des paquets à installer
- ressources : les deux binaires pour openbox-menu qui seront copiés
  dans config/includes.chroot/usr/local/bin pendant la construction

# construction
éditer le script /mkbento pour fixer la version, le nom etc
lancer 'sudo ./mkbento 64' dans les sources pour construire la Bento Openbox 64bits
lancer 'sudo ./mkbento 32' pour Bento Openbox 32bits
lancer 'sudo ./mkbento clean' pour nettoyer les sources entre deux constructions

les images ISOs seront dispo dans les dossiers /bento-openbox-amd64 et /bento-openbox-i386
les fichiers annexes aussi (liste des paquets, somme sha256 et log du build)

# doc
man lb config & man lb build
wiki live-build https://debian-facile.org/doc:install:live-build
