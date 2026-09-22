<?php

declare(strict_types=1);

namespace App\Model;

/**
 * Represente un modele de vetement propose par le tailleur.
 * Equivalent de la classe Realisation cote Flutter/Dart.
 */
class Realisation
{
    private int $id;
    private string $title;
    private string $description;
    private float $price;

    public function __construct(int $id, string $title, string $description, float $price)
    {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->price = $price;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function getPrice(): float
    {
        return $this->price;
    }
}
