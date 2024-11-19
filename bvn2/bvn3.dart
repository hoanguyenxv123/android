
void main() {
  print('GCD = ${gcd(24, 15)}');
  print('LCM = ${lcm(24, 15)}');
}
int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;  // Tìm phần dư của a chia cho b
    a = temp;   // Gán b cho a
  }
  return a;
}
int lcm(int a, int b) {
  return a * b ~/ gcd(a, b);
}
