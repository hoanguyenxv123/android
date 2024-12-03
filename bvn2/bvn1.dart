const int level1 = 50;
const int level2  = 100;
const int level3  = 200;
const int level4  = 300;

const double priceLevel1 = 1.678;
const double priceLevel2 = 1.734;
const double priceLevel3 = 2.014;
const double priceLevel4 = 2.536;
const double priceLevel5 = 2.834;

void main() {
  print(calculateElectricityBill(70).toStringAsFixed(2));
}

double calculateElectricityBill(int electricityNumber) {
  double total = 0;

  if (electricityNumber > level4) {
    total += (electricityNumber - level4) * priceLevel5;
    electricityNumber = level4;
  }
  if (electricityNumber > level3) {
    total += (electricityNumber - level3) * priceLevel4;
    electricityNumber = level3;
  }
  if (electricityNumber > level2) {
    total += (electricityNumber - level2) * priceLevel3;
    electricityNumber = level2;
  }
  if (electricityNumber > level1) {
    total += (electricityNumber - level1) * priceLevel2;
    electricityNumber = level1;
  }
  total += electricityNumber * priceLevel1;

  return total;
}
