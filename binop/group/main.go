package main

import (
  "fmt"
)

func f(n int) int {
  if n == 0 { return 1 }
  return f(n-1) + f(n-1)
}

func g(m, n int) int {
  if n == 1 { return m }
  if m == 1 { return 1 }
  return g(m-1,n) + g(m,n-1)
}
func main() {
  n := 3
  m := 4
  fmt.Printf("f(%d) = %d\ng(%d, %d) = %d\n", n, f(n), m, n, g(m,n))
}
