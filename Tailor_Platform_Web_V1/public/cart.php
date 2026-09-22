<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

use App\Support\CartService;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['action'] ?? '') === 'commander') {
    $panier = CartService::getPanier();

    if ($panier->count() > 0) {
        $total = $panier->getTotal();
        $count = $panier->count();
        CartService::clear();

        header(
            'Location: order_confirmation.php?total=' . rawurlencode((string) $total)
            . '&count=' . rawurlencode((string) $count)
        );
        exit;
    }
}

$panier = CartService::getPanier();
$items = $panier->getItems();

$pageTitle = 'Mon panier - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<a href="catalogue.php" class="back-link mb-3 d-inline-block">&larr; Retour au catalogue</a>

<h1 class="page-title mb-4">Mon panier (<?= $panier->count() ?>)</h1>

<?php if ($items === []): ?>
  <p class="text-muted">Votre panier est vide.</p>
  <a href="catalogue.php" class="btn btn-outline-primary">Voir le catalogue</a>
<?php else: ?>
  <ul class="list-group mb-4">
    <?php foreach ($items as $realisation): ?>
      <li class="list-group-item d-flex justify-content-between align-items-center">
        <div>
          <div class="fw-semibold"><?= e($realisation->getTitle()) ?></div>
          <div class="text-muted small"><?= e($realisation->getDescription()) ?></div>
        </div>
        <span class="price"><?= formatPrice($realisation->getPrice()) ?></span>
      </li>
    <?php endforeach; ?>
  </ul>

  <div class="d-flex justify-content-between align-items-center total-row mb-4">
    <span class="h5 mb-0">Total</span>
    <span class="h5 mb-0"><?= formatPrice($panier->getTotal()) ?></span>
  </div>

  <form method="post">
    <input type="hidden" name="action" value="commander">
    <button type="submit" class="btn btn-primary btn-lg">Commander</button>
  </form>
<?php endif; ?>

<?php require __DIR__ . '/../includes/footer.php'; ?>
