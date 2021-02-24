function arr=riffule_shuffle(y,n,p)
%     Input:
%         y ��������n���Ƶ����顣��1��n������
%         n �����Ƶ�����
%         p ������riffle shuffle�ĸ��ʣ�һ��ȡ1��2��
%     Output:
%         arr ��ϴ֮���Ƶ���������
    labels=zeros(1,n);
    arr=zeros(size(y));
    
    for i=1:n
        if unifrnd(0,1,1)>=p
            labels(i)=1;
        end
    end
    t=sum(labels(:));
    %t����labelΪ1���Ƶ�����
    p1=1;
    p2=n-t+1;
    position_interleavings=ones(1,t);
    k=1;
    for i=find(labels==1)
        position_interleaving=randperm(p2-p1+1,1)+p1-1;
        arr(position_interleaving)=y(i);
        p1=position_interleaving+1;
        position_interleavings(k)=position_interleaving;
        k=k+1;
        p2=p2+1;
    end
    position0=find(labels==0);
    diff_posi=setdiff(1:n,position_interleavings);
    arr(diff_posi(1:n-t))=y(position0(1:n-t));
    disp(labels)
    disp(position_interleavings)
end