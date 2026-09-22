<?php

declare(strict_types=1);

// L'autoloader doit etre enregistre AVANT session_start().
// PHP desiralise le contenu de la session des le demarrage : si la classe
// Realisation n'est pas encore connue a ce moment, on obtient un objet
// incomplet (__PHP_Incomplete_Class) au lieu d'un vrai objet Realisation.
spl_autoload_register(static function (string $class): void {
    $prefix = 'App\\';

    if (!str_starts_with($class, $prefix)) {
        return;
    }

    $relativeClass = substr($class, strlen($prefix));
    $file = __DIR__ . '/../src/' . str_replace('\\', '/', $relativeClass) . '.php';

    if (is_file($file)) {
        require_once $file;
    }
});

if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

/**
 * Echappe une chaine avant affichage HTML (protection XSS de base).
 */
function e(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
}

/**
 * Formate un prix en FCFA, sans decimales, avec espace comme separateur de milliers.
 */
function formatPrice(float $price): string
{
    return number_format($price, 0, ',', ' ') . ' FCFA';
}
