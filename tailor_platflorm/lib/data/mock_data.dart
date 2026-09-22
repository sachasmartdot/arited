import '../models/tailor.dart';
import '../models/realisation.dart';

final mockTailor = Tailor(
  name: 'Atelier SachaSmart', 
  description: 'Creation moderne et traditionnelle', 
  location: 'Yaounde'
);

final List<Realisation> mockRealisations = [
  Realisation(
    image: 'assets/modeles/ben_tailor/ben.jpeg',
    title: 'Chapeau a sortie de pluie', 
    description: 'Un chapeau fait pour sortir sous la pluie',
    price: 1000
  ),
  Realisation(
    image: 'assets/modeles/ben_tailor/ben2.jpeg',
    title: 't-shirt a sortie de pluie', 
    description: 'Un t-shirt fait pour sortir sous la pluie',
    price: 2000
  ),
  Realisation(
    image: 'assets/modeles/ben_tailor/ben3.jpeg',
    title: 'pantalon a sortie de pluie', 
    description: 'Un pantalon fait pour sortir sous la pluie',
    price: 3500
  ),
];

final List<Realisation> cart = [];