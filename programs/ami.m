function res = ami( data, answer, numFeat )

fcol = size( data, 2 );
lcol = size( answer, 2 );
res = zeros( numFeat, 1 );

f_ent = zeros( fcol, 1 );
fl_ent = zeros( fcol, lcol );
for k=1:fcol
    f_ent(k,1) = p_entropy( data(:,k) );
    for m=1:lcol
        fl_ent(k,m) = p_entropy( [data(:,k),answer(:,m)] );
    end
end

ff_ent = NaN( fcol, fcol );

l_ent = zeros( lcol, 1 );
for k=1:lcol
    l_ent(k,1) = p_entropy( answer(:,k) );
end

rel = zeros( fcol, 1 );
for k=1:fcol
    rel(k,1) = f_ent(k,1) * lcol + sum( l_ent ) - sum( fl_ent(k,:) );
end

% select the first feature
trel = sortrows( [(1:fcol)',rel], -2 );
res(1,1) = trel(1,1);

for k=2:numFeat
    trel = [(1:fcol)',rel];
    for m=1:fcol
        for n=1:k-1
            if isnan( ff_ent(m,res(n)) )
                ff_ent(m,res(n)) = p_entropy( [data(:,m),data(:,res(n))] );
                ff_ent(res(n),m) = ff_ent(m,res(n));
            end
            
            trel(k,2) = trel(k,2) ...
                - f_ent(m,1) - f_ent(res(n)) + ff_ent(m,res(n));
        end
    end
    trel(res(1:k-1),2) = -inf;
    trel = sortrows( trel, -2 );
    res(k,1) = trel(1,1);
end


function [res] = p_entropy( vector )

[uidx,~,single] = unique( vector, 'rows' );
count = zeros(size(uidx,1),1);
for k=1:size(vector,1)
    count( single(k), 1 ) = count( single(k), 1 ) + 1;
end
res = -( (count/size(vector,1))'*log2( (count/size(vector,1)) ) );








