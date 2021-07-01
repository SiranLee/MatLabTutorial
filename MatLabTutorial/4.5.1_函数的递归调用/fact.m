function m = fact(n)
  if n<=1
      m = 1;
  else
      m = n*fact(n-1);
  end