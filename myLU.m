function [L U P] = myLU(A)

[m n] = size(A);

P = eye(m); % initialization of permutation matrix

for k = 1:m-1

    [ak j] = max(abs(A(k:m,k))); % find max for pivoting
    
    % check for singularity
        if (ak < eps )
            error('matrix is singular to the machine precision')
        end
    j = j + k-1;  % adjust offset in j 
    ak = A(j,k); % get the pivot
     
    % interchange rows in P
    P([k,j],:) = P([j,k],:);
    
    % interchange j and k rows of A
    A([j,k],:) = A([k,j],:);
    
    for i = k+1 : m
       l = A(i,k)/ak; % get the multiplier
       A(i,k) = l;    % store the multiplier
       A(i,k+1:end) = A(i,k+1:end) - l*A(k,k+1:end);       
    end  
end
 U = triu(A);
 L = tril(A,-1) + eye(m);

 
