<?php

declare(strict_types=1);

namespace App\Support;

use App\Model\Realisation;

/**
 * Panier du client.
 * Equivalent de la List<Realisation> cart cote Flutter/Dart,
 * mais encapsule dans une classe comme le veut la programmation orientee objet.
 */
class Panier
{
    /** @var Realisation[] */
    private array $items;

    /**
     * @param Realisation[] $items
     */
    public function __construct(array $items = [])
    {
        $this->items = $items;
    }

    public function add(Realisation $realisation): void
    {
        $this->items[] = $realisation;
    }

    /**
     * @return Realisation[]
     */
    public function getItems(): array
    {
        return $this->items;
    }

    public function count(): int
    {
        return count($this->items);
    }

    public function getTotal(): float
    {
        $total = 0.0;

        foreach ($this->items as $realisation) {
            $total += $realisation->getPrice();
        }

        return $total;
    }

    public function clear(): void
    {
        $this->items = [];
    }
}
