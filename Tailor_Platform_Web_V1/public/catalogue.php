<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

use App\Data\CatalogueRepository;

$realisations = CatalogueRepository::getAll();

$pageTitle = 'Catalogue - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<a href="index.php" class="back-link mb-3 d-inline-block">&larr; Retour a l'accueil</a>

<h1 class="page-title mb-4">Catalogue</h1>

<?php if ($realisations === []): ?>
  <p class="text-muted">Aucun modele disponible pour le moment.</p>
<?php else: ?>
  <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4">
    <?php foreach ($realisations as $realisation): ?>
      <div class="col">
        <div class="card h-100 model-card">
          <div class="card-body d-flex flex-column">
            <h2 class="card-title h5"><?= e($realisation->getTitle()) ?></h2>
            <p class="card-text text-muted flex-grow-1"><?= e($realisation->getDescription()) ?></p>
            <p class="price"><?= formatPrice($realisation->getPrice()) ?></p>
            <a href="article_detail.php?id=<?= $realisation->getId() ?>" class="btn btn-primary mt-auto">Voir</a>
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
<?php endif; ?>

<?php require __DIR__ . '/../includes/footer.php'; ?>
