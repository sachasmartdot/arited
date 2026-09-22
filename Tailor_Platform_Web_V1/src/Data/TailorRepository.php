<?php

declare(strict_types=1);

namespace App\Data;

use App\Model\Tailor;

/**
 * V1 : un seul tailleur fictif, comme cote Flutter.
 * Cette classe sera remplacee plus tard par un vrai acces aux donnees
 * (base de donnees) quand la plateforme gerera plusieurs tailleurs.
 */
class TailorRepository
{
    public static function getCurrent(): Tailor
    {
        return new Tailor(
            'Atelier Mballa',
            'Atelier de couture sur mesure, specialise dans les tenues traditionnelles et modernes.',
            'Yaounde, Cameroun'
        );
    }
}
