<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

$pageTitle = 'Accueil - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<section class="home-hero text-center">
  <h1 class="page-title mb-2">Tailor Platform</h1>
  <p class="text-muted mb-4">Plateforme qui met en relation clients et tailleurs.</p>

  <div class="d-flex flex-column flex-sm-row justify-content-center gap-3">
    <a href="catalogue.php" class="btn btn-primary btn-lg px-4">Client</a>
    <a href="tailor_profile.php" class="btn btn-outline-primary btn-lg px-4">Tailleur</a>
  </div>
</section>

<?php require __DIR__ . '/../includes/footer.php'; ?>
