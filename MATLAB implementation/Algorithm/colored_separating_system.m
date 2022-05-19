function I = separating_system(crn,color)
n = size(color,2);
l = ceil(log2(crn));
I = false(2*l,n);
for bit=1:l
    for i=0:(crn-1)
        c = dec2bin(i);
        lc = length(c);
        if(i<2^(bit-1) ||  c(lc - bit +1)=='0')
            I(2*bit-1, color==(i+1))=true;
        else
            I(2*bit, color==(i+1))=true;
        end
    end
end
end

