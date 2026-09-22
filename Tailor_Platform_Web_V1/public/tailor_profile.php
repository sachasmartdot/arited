<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

use App\Data\CatalogueRepository;
use App\Data\TailorRepository;

$tailor = TailorRepository::getCurrent();
$realisations = CatalogueRepository::getAll();

$pageTitle = 'Profil tailleur - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<a href="index.php" class="back-link mb-3 d-inline-block">&larr; Retour a l'accueil</a>

<section class="tailor-card mb-4">
  <h1 class="page-title mb-1"><?= e($tailor->getName()) ?></h1>
  <p class="text-muted mb-2"><?= e($tailor->getLocation()) ?></p>
  <p class="mb-0"><?= e($tailor->getDescription()) ?></p>
</section>

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2 class="section-title mb-0">Mon catalogue</h2>
  <a href="add_article.php" class="btn btn-primary">Ajouter un modele</a>
</div>

<?php if ($realisations === []): ?>
  <p class="text-muted">Aucun modele pour le moment.</p>
<?php else: ?>
  <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4">
    <?php foreach ($realisations as $realisation): ?>
      <div class="col">
        <div class="card h-100 model-card">
          <div class="card-body d-flex flex-column">
            <h3 class="card-title h5"><?= e($realisation->getTitle()) ?></h3>
            <p class="card-text text-muted flex-grow-1"><?= e($realisation->getDescription()) ?></p>
            <p class="price mb-0"><?= formatPrice($realisation->getPrice()) ?></p>
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
<?php endif; ?>

<?php require __DIR__ . '/../includes/footer.php'; ?>
