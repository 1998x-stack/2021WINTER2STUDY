function [Chrom,Lind,BaseV]=mycrtbp(Nind,Lind,Base)
%     create an initial population
%     binary population of given size and structure
%     Input:
%         Nind: Either a scalar containing the number of individuals in the new population or a row vector of length 2 containing the number of individuals and their length
%         Lind: A scalar containg the length of the individual chromesones.
%         Base: A scalar containing the base of chromesome elements or a row vector containing the base(s) of the loci of the chromosomes.
%     Output:
%         Chrom: A matrix containing the random valued chromosomes row wise
%         Lind: A scalar containing the length of the chromosome
%         BaseV: A row vector containing the base of the chromosome loci
    nargs=nargin;
    if nargs>=1
        [mN,nN]=size(Nind);
    end
    if nargs>=2
        [mL,nL]=size(Lind);
    end
    if nargs==3
        [mB,nB]=size(Base);
    end
    
    if nN==2
        if (nargs==1)
            Lind=Nind(2);
            Nind=Nind(1);
            BaseV=mycrtbase(Lind);
        elseif (nargs==2 && nL==2)
            BaseV=mycrtbase(Nind(2));
            Niind=Nind(1);
        elseif (nargs==2 && nL>1)
            if Lind~=length(Lend) %%??
                error('Lind and Base disagree')
            end
            BaseV=Lind;
            Lind=Nind(2);Nind=Nind(1);
        end
    elseif nN==1
        if nargs==2
            if nL==1
                BaseV=mycrtbase(Lind);
            else
                BaseV=Lind;
                Lind=nL;
            end
        elseif nargs==3
            if nB==1
                BaseV=mycrtbase(Lind,Base);
            elseif nB~=Lind
                error('Lind and Base disagree');
            else BaseV=Base;
            end
        end
    else
        error('Input parameters inconsistent');
    end
    Chrom=floor(rand(Nind,Lind).*BaseV(ones(Nind,1),:));
end