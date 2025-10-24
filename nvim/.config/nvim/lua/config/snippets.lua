local ls = require("luasnip")
local snip = ls.snippet
local txt = ls.text_node
local ins = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("php", {
	snip("php", {
		txt("<?php "),
		ins(1),
		txt(" ?>"),
	}),
})

ls.add_snippets("javascript", {
	snip("ty", {
		txt({ "/**", " * " }),
		ins(1),
		txt({ "", " */" }),
	}),
	snip("t1", {
		txt({ "/** " }),
		ins(1),
		txt({ " */" }),
	}),
})

ls.add_snippets("cpp", {
	snip(
		"cp++",
		fmt(
			[[
#include <bits/stdc++.h>

using namespace std;

typedef long long ll;
typedef vector<int> vi;
typedef vector<ll> vll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

#define MOD 1000000007
#define FAST_IO                                                                \
  ios::sync_with_stdio(0);                                                     \
  cin.tie(0);                                                                  \
  cout.tie(0);
#define pb push_back
#define all(v) v.begin(), v.end()

// Useful Functions
ll gcd(ll a, ll b) { return b ? gcd(b, a % b) : a; }

ll lcm(ll a, ll b) { return a / gcd(a, b) * b; }

ll power(ll a, ll b, ll mod = MOD) {
  ll res = 1;
  a %= mod;
  while (b > 0) {
    if (b % 2)
      res = (res * a) % mod;
    a = (a * a) % mod;
    b /= 2;
  }
  return res;
}

ll mod_inverse(ll a, ll mod = MOD) { return power(a, mod - 2, mod); }

bool is_prime(ll n) {
  if (n <= 1)
    return false;
  if (n <= 3)
    return true;
  if (n % 2 == 0 || n % 3 == 0)
    return false;
  for (ll i = 5; i * i <= n; i += 6)
    if (n % i == 0 || n % (i + 2) == 0)
      return false;
  return true;
}

ll factorial(ll n, ll mod = MOD) {
  ll res = 1;
  for (ll i = 2; i <= n; i++) {
    res = (res * i) % mod;
  }
  return res;
}

ll nCr(ll n, ll r, ll mod = MOD) {
  if (r > n)
    return 0;
  ll num = factorial(n, mod);
  ll denom = (factorial(r, mod) * factorial(n - r, mod)) % mod;
  return (num * mod_inverse(denom, mod)) % mod;
}

ll nPr(ll n, ll r, ll mod = MOD) {
  if (r > n)
    return 0;
  ll num = factorial(n, mod);
  ll denom = factorial(n - r, mod);
  return (num * mod_inverse(denom, mod)) % mod;
}

//-------------------------------------------------------------------
void problem() {
  ll n, q;
  cin >> n >> q;
}

int main() {
  FAST_IO

  @!

  return 0;
}
    ]],
			{
				ins(0),
			},
			{ delimiters = "@!" }
		)
	),
})
