% Created by Chandrahas Tirumalasetty 12-March-2016
% licensed under The MIT License (MIT)
% Copyright (c) 2016 Chandrahas Tirumalasetty
% https://opensource.org/licenses/mit-license.php
clc
clear all
n=input('Enter the value of n:');
k=input('Enter the value of k:');
if(n-k==0)
    g=1;
elseif(n-k==1)
    g=[1 1];
else
a=[1 zeros(1,n-1) -1]; %  initialiazation of x^n -1 
nc=2^(n-k-1)-1; %total no.of possibilities for generator polynomial
c=0;
ri=1;
for i=0:nc
    b=de2bi(c,n-k-1);
    p=flip([1 b 1]);
    [q,r]=deconv(a,p);
    r=rem(r,2);
    if(r(:,:)==0)
        g(ri,:)=p;
        ri=ri+1;
    end 
    c=c+1;
end 
end 
display(g);