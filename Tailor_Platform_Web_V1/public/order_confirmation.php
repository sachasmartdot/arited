<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

$total = isset($_GET['total']) && is_numeric($_GET['total']) ? (float) $_GET['total'] : 0.0;
$count = isset($_GET['count']) && is_numeric($_GET['count']) ? (int) $_GET['count'] : 0;

$pageTitle = 'Commande confirmee - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<section class="confirmation-card text-center">
  <div class="confirmation-icon">&#10003;</div>
  <h1 class="page-title">Commande confirmee</h1>
  <p class="text-muted">
    Merci pour votre commande de <?= $count ?> modele<?= $count > 1 ? 's' : '' ?>.
  </p>
  <p class="price fs-4">Total paye : <?= formatPrice($total) ?></p>
  <a href="catalogue.php" class="btn btn-primary btn-lg mt-3">Retour au catalogue</a>
</section>

<?php require __DIR__ . '/../includes/footer.php'; ?>
