function [ hit_rate, hit_ratet ] = mySVDYaleChecker( k )

[V, alpha, Average] = mySVDYaleDatabasing(k);
s = '../../../CroppedYale/';
B = dir(s);
B = B(3:end);
count = 0;
countt = 0;
total = 0;
for i=1:38
    D = dir(strcat(s, B(i).name));
    D = D(3:end);
    for j=41:60
        f = im2double(imread(strcat(s,B(i).name,'/',D(j).name)));
        [index, indext] = mySVDYaleTesting(f, V, alpha, Average);
        total = total + 1;
        if index  == i
            count = count + 1;
        end
        if indext == i
            countt = countt + 1;
        end
    end
end
hit_rate = count / total;
hit_ratet = countt/total;
if k == 0
    hit_rate = 0;
end

