range = n => [...Array(n)]
  .map((_,i) => i)
primes = [2,3,5,7,11,13]
max_r = 8

gcd = a => b => {
  if (a > b) {
    return gcd(b)(a)
  }
  if (a == 0) {
    return b
  }
  return gcd(b%a)(a)
}

p = 13
r = 4

// computationally
computed_n = range(p**r)
  .reduce((acc,i) => acc + (gcd(i)(p**4) == 1 ? 1 : 0))
// formula
derived_n = p**r - p**(r-1)


let ok = true
primes.forEach( p => range(max_r).forEach( r => {
  if (computed_n != derived_n) {
    console.error(`Error: With p = ${p}, r = ${r}, computed_n = ${computed_n}, but derived_n = ${derived_n}`)
    ok = false
  }
}))

if (ok) {
  console.log('OK')
}
