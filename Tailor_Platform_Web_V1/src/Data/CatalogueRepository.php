<?php

declare(strict_types=1);

namespace App\Data;

use App\Model\Realisation;

/**
 * Fournit le catalogue de realisations.
 * V1 sans base de donnees : les donnees vivent dans la session,
 * initialisees a partir d'un jeu de donnees fictif (mock data),
 * exactement comme mockRealisations cote Flutter.
 */
class CatalogueRepository
{
    private const SESSION_KEY = 'realisations';

    /**
     * @return Realisation[]
     */
    public static function getAll(): array
    {
        self::ensureInitialized();

        return $_SESSION[self::SESSION_KEY];
    }

    public static function findById(int $id): ?Realisation
    {
        foreach (self::getAll() as $realisation) {
            if ($realisation->getId() === $id) {
                return $realisation;
            }
        }

        return null;
    }

    public static function add(string $title, string $description, float $price): Realisation
    {
        self::ensureInitialized();

        $realisation = new Realisation(self::nextId(), $title, $description, $price);
        $_SESSION[self::SESSION_KEY][] = $realisation;

        return $realisation;
    }

    private static function nextId(): int
    {
        $ids = array_map(
            static fn (Realisation $realisation): int => $realisation->getId(),
            $_SESSION[self::SESSION_KEY]
        );

        return $ids === [] ? 0 : max($ids) + 1;
    }

    private static function ensureInitialized(): void
    {
        if (!isset($_SESSION[self::SESSION_KEY]) || !is_array($_SESSION[self::SESSION_KEY])) {
            $_SESSION[self::SESSION_KEY] = self::mockRealisations();
        }
    }

    /**
     * @return Realisation[]
     */
    private static function mockRealisations(): array
    {
        return [
            new Realisation(0, 'Costume traditionnel', 'Costume deux pieces sur mesure', 45000.0),
            new Realisation(1, 'Robe elegante', 'Robe realisee sur mesure', 35000.0),
            new Realisation(2, 'Chemise classique', 'Chemise personnalisee', 20000.0),
        ];
    }
}
