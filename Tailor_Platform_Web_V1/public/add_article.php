<?php

declare(strict_types=1);

require_once __DIR__ . '/../includes/bootstrap.php';

use App\Data\CatalogueRepository;

$errors = [];
$title = '';
$description = '';
$priceRaw = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = trim((string) ($_POST['title'] ?? ''));
    $description = trim((string) ($_POST['description'] ?? ''));
    $priceRaw = trim((string) ($_POST['price'] ?? ''));

    if ($title === '') {
        $errors[] = 'Le titre est obligatoire.';
    }

    if ($description === '') {
        $errors[] = 'La description est obligatoire.';
    }

    if ($priceRaw === '' || !is_numeric($priceRaw) || (float) $priceRaw <= 0) {
        $errors[] = 'Le prix doit etre un nombre superieur a 0.';
    }

    if ($errors === []) {
        CatalogueRepository::add($title, $description, (float) $priceRaw);
        header('Location: tailor_profile.php');
        exit;
    }
}

$pageTitle = 'Ajouter un modele - Tailor Platform';
require __DIR__ . '/../includes/header.php';
?>

<a href="tailor_profile.php" class="back-link mb-3 d-inline-block">&larr; Retour au profil</a>

<h1 class="page-title mb-4">Ajouter un modele</h1>

<?php if ($errors !== []): ?>
  <div class="alert alert-danger">
    <ul class="mb-0">
      <?php foreach ($errors as $error): ?>
        <li><?= e($error) ?></li>
      <?php endforeach; ?>
    </ul>
  </div>
<?php endif; ?>

<form method="post" class="form-card" novalidate>
  <div class="mb-3">
    <label for="title" class="form-label">Titre</label>
    <input
      type="text"
      class="form-control"
      id="title"
      name="title"
      value="<?= e($title) ?>"
      required
    >
  </div>

  <div class="mb-3">
    <label for="description" class="form-label">Description</label>
    <textarea
      class="form-control"
      id="description"
      name="description"
      rows="3"
      required
    ><?= e($description) ?></textarea>
  </div>

  <div class="mb-3">
    <label for="price" class="form-label">Prix (FCFA)</label>
    <input
      type="number"
      step="1"
      min="0"
      class="form-control"
      id="price"
      name="price"
      value="<?= e($priceRaw) ?>"
      required
    >
  </div>

  <div class="d-flex gap-2">
    <button type="submit" class="btn btn-primary">Enregistrer</button>
    <a href="tailor_profile.php" class="btn btn-outline-secondary">Annuler</a>
  </div>
</form>

<?php require __DIR__ . '/../includes/footer.php'; ?>
