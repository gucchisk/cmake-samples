#include <iostream>
#include <absl/memory/memory.h>
#include <absl/strings/ascii.h>

int main() {
  std::unique_ptr<std::string> str_ptr = absl::make_unique<std::string>("hello");
  std::cout << *str_ptr << std::endl;

#ifdef ABSEIL_UPPER
  absl::AsciiStrToUpper(str_ptr.get());
  std::cout << "absl::AsciiStrToUpper:" << *str_ptr << std::endl;
#else
  std::cout << "std::uppercase:";
  std::cout << std::uppercase;
  std::cout << *str_ptr << std::endl;
#endif
  return 0;
}
