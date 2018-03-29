a = [1 2; 3 4];
b = [5 1; 2 8];
c = [10 100; 50 150];
k = b > a ;
disp(k);
if (k == 0)
    k = c;
end
disp(k);
if (k == 1)
    k = 200 - c;
end
t = k;

disp(max(a(1,1),b(1,1), c(1,1)));
