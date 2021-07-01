function m = ffib(n)
  if(n==1||n==2)
      m = 1;
  else
      m = ffib(n-1)+ffib(n-2);
  end
end