function [W] = bCSP(data1, data2, L)

% data1 : Class1 input.
% data2 : Class2 output.
% L : Number of samples.

% Normalized spatial covariance for channel1
k=1;
R1 = 0;

for i = 1:L
    d1 = data1(k : k+1200 - 1);
    r1 = d1 * d1';
    r1 = r1 / trace(r1);
    
    R1 = R1+ r1;
    k = k + 1200;
end

R1 = R1/L;

% Normalized spatial covariance for channel1
k=1;
R2 = 0;

for i = 1:L
    d2 = data2(k : k+1200 - 1);
    r2 = d2 * d2';
    r2 = r2 / trace(r2);
    
    R2 = R2+ r2;
    k = k + 1200;
end

R2 = R2/L;

% Eqn 2
Rsum = R1+R2;  % usually make average of the total samples.

% Find Eigenvalues and Eigenvectors of RC
[EVecsum,EValsum] = eig(Rsum);
[EValsum,ind] = sort(diag(EValsum),'descend'); % Sort eigenvalues in descending order
EVecsum = EVecsum(:,ind); % Rearrange eigenvector from the indeces of eigenvalues in decending order

% Eqn 3
% Find Whitening Transformation Matrix
P = sqrt(pinv(diag(EValsum))) * EVecsum';

% Whiten Data Using Whiting Transform
S1 = P * R1 * P';
S2 = P * R2 * P';

% Eqn 5
% [U1,Psi1] = eig(S1);
% [U2,Psi2] = eig(S2);

%generalized eigenvectors/values
[U,D] = eig(S1,S2); 

% [V,D] = eig(A,B) 
% returns diagonal matrix D of generalized eigenvalues and full matrix V 
% whose columns are the corresponding right eigenvectors, so that A*V = B*V*D.

% Simultanous diagonalization
% Should be equivalent to [B,D]=eig(S1);

% verify algorithim
%disp('test1:Psi1+Psi2=I')
%Psi1+Psi2

% sort ascending by default
%[Psi1,ind] = sort(diag(Psi1)); U1 = U1(:,ind);
%[Psi2,ind] = sort(diag(Psi2)); U2 = U2(:,ind);
[~,ind]=sort(diag(D));
U=U(:,ind);

% Resulting Projection Matrix-these are the spatial filter coefficients
W = U'*P;

% % Extracting the classes
% class1 = W(1,:)';
% class2 = W(2,:)';

% Calculating the z values
% k=1;
% 
% for i = 1:L
%     d1 = data1(k : k+1200 - 1);
%     Z1{i,1} = W*d1;
%     k = k + 1200;
% end
% 
% k=1;
% 
% for i = 1:L
%     d2 = data2(k : k+1200 - 1);
%     Z2{i,1} = W*d2;
%     k = k + 1200;
% end

end
