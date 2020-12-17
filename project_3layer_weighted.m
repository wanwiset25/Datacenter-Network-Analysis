clear
N = 12;
n = 3;
C = 10;
bigC = 100;
m=50;
k = 3;
l = 4;
xmax = m*C;
ymax = bigC;
V = 50;
T = (V+1)*10^3;
x = cell(1,k);

for K = 1:k
x{K} = zeros(1,T+1);
end
w = ones(1,k);
w(1) = 6;

y = cell(1,T+1);
Q = cell(1,T+1);
Z = cell(1,T+1);
for i=1:T+10
    Q{i} = zeros(N,N);
    Z{i} = zeros(1,k);
    y{i} = zeros(k,l);
end



links = zeros(N,N);
links(1,2)=1;
links(1,3)=1;
links(1,4)=1;
links(2,5)=1;
links(2,6)=1;
links(3,7)=1;
links(3,8)=1;
links(3,9)=1;
links(4,7)=1;
links(4,8)=1;
links(4,9)=1;
links(5,10)=1;
links(5,11)=1;
links(5,12)=1;
links(6,10)=1;
links(6,11)=1;
links(6,12)=1;

a = cell(k,l)

for K = 1:k
    for L = 1:l
        a{K,L} = zeros(N,N);
    end
end

a{1,1}(3,7) = 1;
a{1,1}(1,3) = 1;
a{1,1}(1,2) = 1;
a{1,1}(2,5) = 1;
a{1,1}(5,10) = 1;
a{1,2}(4,7) = 1;
a{1,2}(1,4) = 1;
a{1,2}(1,2) = 1;
a{1,2}(2,5) = 1;
a{1,2}(5,10) = 1;
a{1,3}(3,7) = 1;
a{1,3}(1,3) = 1;
a{1,3}(1,2) = 1;
a{1,3}(2,6) = 1;
a{1,3}(6,10) = 1;
a{1,4}(4,7) = 1;
a{1,4}(1,4) = 1;
a{1,4}(1,2) = 1;
a{1,4}(2,6) = 1;
a{1,4}(6,10) = 1;

a{2,1}(3,8) = 1;
a{2,1}(1,3) = 1;
a{2,1}(1,2) = 1;
a{2,1}(2,5) = 1;
a{2,1}(5,10) = 1;
a{2,2}(4,8) = 1;
a{2,2}(1,4) = 1;
a{2,2}(1,2) = 1;
a{2,2}(2,5) = 1;
a{2,2}(5,10) = 1;
a{2,3}(3,8) = 1;
a{2,3}(1,3) = 1;
a{2,3}(1,2) = 1;
a{2,3}(2,6) = 1;
a{2,3}(6,10) = 1;
a{2,4}(4,8) = 1;
a{2,4}(1,4) = 1;
a{2,4}(1,2) = 1;
a{2,4}(2,6) = 1;
a{2,4}(6,10) = 1;

a{3,1}(3,9) = 1;
a{3,1}(1,3) = 1;
a{3,1}(1,2) = 1;
a{3,1}(2,5) = 1;
a{3,1}(5,11) = 1;
a{3,2}(4,9) = 1;
a{3,2}(1,4) = 1;
a{3,2}(1,2) = 1;
a{3,2}(2,5) = 1;
a{3,2}(5,11) = 1;
a{3,3}(3,9) = 1;
a{3,3}(1,3) = 1;
a{3,3}(1,2) = 1;
a{3,3}(2,6) = 1;
a{3,3}(6,11) = 1;
a{3,4}(4,9) = 1;
a{3,4}(1,4) = 1;
a{3,4}(1,2) = 1;
a{3,4}(2,6) = 1;
a{3,4}(6,11) = 1;





for t = 1:T
    for i = 1:N
        for j = 1:N
            if links(i,j) == 1
                sum2 = 0;
                for K = 1:k
                    for L = 1:l
                        sum2 = sum2 + a{K,L}(i,j)*y{t}(K,L);
                    end
                end
                sum2;
                if i == 1 && j == 2
                    Q{t+1}(i,j) = max(Q{t}(i,j)+sum2-bigC, 0);
                else
                    Q{t+1}(i,j) = max(Q{t}(i,j)+sum2-C, 0);
                end
            end
        end
    end
    for K = 1:k
        sum3 = 0;
        for L = 1:l
            sum3 = sum3 + y{t}(K,L);
            L;
            sum3;
        end
        Z{t+1}(K) = max(Z{t}(K)-sum3+x{K}(t),0);
        temp = ((V*w(K))/Z{t}(K)) - 1;
        if temp < 0
            temp = 0;
        end
        if temp > xmax
            temp = xmax;
        end
        x{K}(t+1) = temp;
        
        for L = 1:l
            
            sum4 = sum(sum(Q{t}.*a{K,L}));
            
            if sum4 > Z{t}(K)
                y{t+1}(K,L) = 0;
            else 
                y{t+1}(K,L) = ymax;
            end
        end
       
    end
    
end
avg = zeros(k,l);
for t = 1:T
    for K = 1:k
        for L = 1:l
            avg(K,L) = avg(K,L) + y{t}(K,L);
        end
    end
end

avg=avg/T

xbar1 = mean(x{1})
xbar2 = mean(x{2})
xbar3 = mean(x{3})
util = log(1+xbar1)+log(1+xbar2)+log(1+xbar3)



