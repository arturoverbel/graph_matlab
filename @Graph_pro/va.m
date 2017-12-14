function y = va(obj, x,p)

    switch nargin
        case 3
            y = rand;
        otherwise
            disp('Argument invalids');
            return;
    end
    
    cdf = cumsum(p);
    total = numel(x);

    pos = 1;

    for n = 1:total-1
        pos = pos + (y>=cdf(n));
    end
    y = x(pos);
end