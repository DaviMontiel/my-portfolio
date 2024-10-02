enum AboutMeSection {
  hello,
  experience,
  academmic,
  hobbies;

  static AboutMeSection fromIndex(int index) {
    return AboutMeSection.values[index];
  }
}