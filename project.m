clear
N = 9;
n = 3;
C = 10;
m=100;
xmax = m*C;
V = 0.5;
T = (V+1)*10^4;
Q = cell(1,T+1);
for i=1:T+10
    Q{i} = zeros(N,N);
end
x1 = zeros(1,T+1);
x2 = zeros(1,T+1);
x3 = zeros(1,T+1);
W1 = zeros(1,T+1);
W2 = zeros(1,T+1);
W3 = zeros(1,T+1);

links = zeros(N,N);
links(1,4)=1;
links(1,5)=1;
links(1,6)=1;
links(1,7)=1;
links(1,8)=1;
links(1,9)=1;
links(2,4)=1;
links(2,5)=1;
links(2,6)=1;
links(2,7)=1;
links(2,8)=1;
links(2,9)=1;
links(3,4)=1;
links(3,5)=1;
links(3,6)=1;
links(3,7)=1;
links(3,8)=1;
links(3,9)=1;

a1 = zeros(N,N);
a2 = zeros(N,N);
a3 = zeros(N,N);
a1(1,4)=1;
a1(1,7)=1;
a2(2,4)=1;
a2(2,7)=1;
a3(3,4)=1;
a3(3,7)=1;
a2(1,5)=1;
a2(1,8)=0;
a2(2,5)=0;
a2(2,8)=0;
a2(3,5)=0;
a2(3,8)=0;
a3(1,6)=0;
a3(1,9)=0;
a3(2,6)=0;
a3(2,9)=0;
a3(3,6)=0;
a3(3,9)=0;



for t = 1:T
    for i = 1:N
        for j = 1:N
            if links(i,j) == 1
                Q{t+1}(i,j) = max(Q{t}(i,j)+a1(i,j)*x1(t)+a2(i,j)*x2(t)+a3(i,j)*x3(t)-C, 0);
            end
        end
    end
    
    
    
    W1(t) = sum(sum(Q{t}.*a1));
    W2(t) = sum(sum(Q{t}.*a2));
    W3(t) = sum(sum(Q{t}.*a3));
    x1(t+1) = V/W1(t)-1;
    x2(t+1) = V/W2(t)-1;
    x3(t+1) = V/W3(t)-1;
    if x1(t+1) > xmax
        x1(t+1) = xmax;
    end
    if x1(t+1) < 0
        x1(t+1) = 0;
    end
    if x2(t+1) > xmax
        x2(t+1) = xmax;
    end
    if x2(t+1) < 0
        x2(t+1) = 0;
    end
    if x3(t+1) > xmax
        x3(t+1) = xmax;
    end
    if x3(t+1) < 0
        x3(t+1) = 0;
    end
end



xbar1 = mean(x1)
xbar2 = mean(x2)
xbar3 = mean(x3)
util = log(1+xbar1)+log(1+xbar2)+log(1+xbar3)
V


