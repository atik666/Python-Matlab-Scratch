function standardize = stdFun(X)

m = mean(X);
A = X - m;
B = std(X);

for i= 1:size(A,2)
    standardize(:,i) = A(:,i)/B(:,i);
end

end