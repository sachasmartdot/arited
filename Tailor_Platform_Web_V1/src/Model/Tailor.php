<?php

declare(strict_types=1);

namespace App\Model;

/**
 * Represente le tailleur.
 * Equivalent de la classe Tailor cote Flutter/Dart.
 */
class Tailor
{
    private string $name;
    private string $description;
    private string $location;

    public function __construct(string $name, string $description, string $location)
    {
        $this->name = $name;
        $this->description = $description;
        $this->location = $location;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function getLocation(): string
    {
        return $this->location;
    }
}
