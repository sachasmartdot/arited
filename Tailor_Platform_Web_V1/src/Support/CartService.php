<?php

declare(strict_types=1);

namespace App\Support;

use App\Model\Realisation;

/**
 * Fait le lien entre la classe Panier et la session PHP.
 * Sans base de donnees, la session joue le meme role que la variable
 * en memoire "cart" cote Flutter : elle vit le temps de la visite.
 */
class CartService
{
    private const SESSION_KEY = 'cart';

    public static function getPanier(): Panier
    {
        self::ensureInitialized();

        return new Panier($_SESSION[self::SESSION_KEY]);
    }

    public static function add(Realisation $realisation): void
    {
        self::ensureInitialized();
        $_SESSION[self::SESSION_KEY][] = $realisation;
    }

    public static function clear(): void
    {
        $_SESSION[self::SESSION_KEY] = [];
    }

    private static function ensureInitialized(): void
    {
        if (!isset($_SESSION[self::SESSION_KEY]) || !is_array($_SESSION[self::SESSION_KEY])) {
            $_SESSION[self::SESSION_KEY] = [];
        }
    }
}
