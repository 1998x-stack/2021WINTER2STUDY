function [L,U,P]=lutx(A)
%     LU Triangylar factorization
%     [L,U,P]=lutx(A) produces:
%     1. a unit lower triangular matrix L
%     2. an upper triangular matrix U
%     3. a permutation vector
%     satisfies:
%     L*U=A(p:);
    [~,n]=size(A);
    p=(1:n)';
    
    for k=1:n-1
        % Find largest element below diagonal in k-th column
        [~,m]=max(A(k:n,k));
        m=m+k-1; % real index 
        
        % skip elimination if column is zero
        if A(m,k)~=0
            
            % if the max index is not at the position of diag, then swap pivot row
            if m~=k
                A([k m],:)=A([m k],:);
                p([k,m])=p([m k]);% swap the permutaion index when swap the pivot row
            
            end
            
            % Compute multipliers which will be applied at the position below
            % the k-th matrix
            i=k+1:n;
            A(i,k)=A(i,k)/A(k,k);

            % Update the remainder of the matrix
            j=k+1:n;
            A(i,j)=A(i,j)-A(i,k)*A(k,j);% very important and computation cost lots
        end
    end
    
    L=tril(A,-1)+eye(n);
    U=triu(A);
    P=zeros(n);
    for i=1:n
        P(i,p(i))=1;
    end
end