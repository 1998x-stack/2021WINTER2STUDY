function A=diagm(varargin)
    A=[];
    for i=1:length(varargin)
        A2=varargin{i};
        A(size(A,1)+1:size(A,1)+size(A2,1),size(A,2)+1:size(A,2)+size(A2.2))=A2;
    end
end