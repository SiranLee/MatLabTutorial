function cmap = jets(m)
   c = jet(16);
   e = ones(m/16,1);
   cmap = kron(e,c);
end