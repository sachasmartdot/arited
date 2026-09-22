<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

use App\Data\CatalogueRepository;
use App\Support\CartService;

$id = isset($_GET['id']) && is_numeric($_GET['id']) ? (int) $_GET['id'] : null;
$realisation = $id !== null ? CatalogueRepository::findById($id) : null;

if ($realisation === null) {
    header('Location: catalogue.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['action'] ?? '') === 'add_to_cart') {
    CartService::add($realisation);
    header('Location: catalogue.php');
    exit;
}

$pageTitle = $realisation->getTitle() . ' - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<a href="catalogue.php" class="back-link mb-3 d-inline-block">&larr; Retour au catalogue</a>

<section class="detail-card">
  <h1 class="page-title"><?= e($realisation->getTitle()) ?></h1>
  <p class="lead"><?= e($realisation->getDescription()) ?></p>
  <p class="price fs-4"><?= formatPrice($realisation->getPrice()) ?></p>

  <form method="post">
    <input type="hidden" name="action" value="add_to_cart">
    <button type="submit" class="btn btn-primary btn-lg">Ajouter au panier</button>
  </form>
</section>

<?php require __DIR__ . '/../includes/footer.php'; ?>
