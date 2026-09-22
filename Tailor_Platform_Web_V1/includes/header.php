<?php

declare(strict_types=1);

use App\Support\CartService;

/** @var string $pageTitle */
$cartCount = CartService::getPanier()->count();
?>
<!doctype html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?= e($pageTitle ?? 'Tailor Platform') ?></title>
<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<header class="site-header">
  <nav class="navbar navbar-expand-md">
    <div class="container">
      <a class="navbar-brand" href="index.php">
        <span class="brand-logo">T</span>
        <span>Tailor Platform</span>
      </a>
      <a href="cart.php" class="btn btn-outline-cart position-relative">
        Panier
        <?php if ($cartCount > 0): ?>
          <span class="badge-cart"><?= $cartCount ?></span>
        <?php endif; ?>
      </a>
    </div>
  </nav>
</header>

<main class="container py-4">
