
y = zeros(1,100);
x = 1:10:1000;

for i=1:100
    %y(i) = project_performance(x(i));

end

y
plot(x,y)


T = (x+1)*10^2;
plot(x,T)
xlabel('learning rate (V)')
ylabel('queue size (T)')