# Tailor Platform - Version Web (PHP / Bootstrap) - V1

Version web de Tailor Platform, avec exactement le meme perimetre que la V1
mobile Flutter : le tailleur vend des modeles, le client en achete. Pas de
base de donnees, pas d'authentification, pas de paiement reel.

## Lancer le projet en local

Il faut PHP 8.1 ou plus (recommande : 8.3), sans extension supplementaire.

Depuis le dossier `tailor_platform_web/` :

```
php -S localhost:8000 -t public
```

Puis ouvrir http://localhost:8000 dans le navigateur.

## Structure du projet

```
tailor_platform_web/
  src/
    Model/
      Tailor.php          classe Tailor (name, description, location)
      Realisation.php     classe Realisation (id, title, description, price)
    Support/
      Panier.php          classe Panier (logique du panier : add, total, clear)
      CartService.php     fait le lien entre Panier et la session PHP
    Data/
      CatalogueRepository.php  fournit et stocke les Realisation (session)
      TailorRepository.php     fournit le tailleur fictif (V1 : un seul)
  includes/
    bootstrap.php         autoload des classes App\, demarrage de la session
    header.php            en-tete HTML commun (nav, panier)
    footer.php            pied de page HTML commun
  public/                 racine web (document root)
    index.php             accueil (boutons Client / Tailleur)
    tailor_profile.php    profil + catalogue du tailleur, bouton "Ajouter"
    add_article.php       formulaire d'ajout d'un modele
    catalogue.php         catalogue client
    article_detail.php    detail d'un modele + ajout au panier
    cart.php              panier, total, bouton "Commander"
    order_confirmation.php  page de confirmation de commande
    assets/
      css/style.css       styles (palette reprise du design fourni)
      vendor/bootstrap/   Bootstrap 5 en local (css + js .min)
```

## Choix techniques (V1)

- Pas de base de donnees : les realisations et le panier vivent dans la
  session PHP (`$_SESSION`), ce qui joue le meme role que les List en memoire
  cote Flutter. Fermer completement le navigateur remet les donnees a zero.
- Un seul tailleur fictif pour cette V1 (comme dans l'app mobile).
- Autoload maison (pas de composer) : les classes du dossier `src/App/...`
  sont chargees automatiquement via `spl_autoload_register` dans
  `includes/bootstrap.php`.
- Bootstrap 5 est copie en local dans `public/assets/vendor/bootstrap`
  (fichiers `.min.css` / `.min.js`), aucune dependance a un CDN.
- La palette de couleurs (terracotta, forest, sable, creme) reprend le design
  fourni. Les polices utilisees sont des polices systeme proches (le site
  fonctionne donc hors connexion, sans appel a Google Fonts).

## Parcours couvert (identique a la V1 mobile)

```
TAILLEUR
profil/catalogue -> ajouter un modele -> modele visible dans le catalogue

CLIENT
catalogue -> detail du modele -> ajouter au panier -> panier
-> calcul du total -> commander -> confirmation de commande
-> retour au catalogue
```
