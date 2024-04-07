enum Modality {
  walk,
  run,
  jump,
}

extension ModalityExtension on Modality {
  String get value {
    switch (this) {
      case Modality.run:
        return 'run';
      case Modality.jump:
        return 'jump';
      case Modality.walk:
        return 'walk';
    }
  }
}

extension ModalityParser on String {
  Modality parseModality() {
    switch (this) {
      case 'run':
        return Modality.run;
      case 'jump':
        return Modality.jump;
      case 'walk':
        return Modality.walk;
      default:
        throw ArgumentError('Invalid Modality value: $this');
    }
  }
}
