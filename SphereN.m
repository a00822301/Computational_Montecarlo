% Monte Carla
AreaSphere = zeros(1,12);
n=9;
i=2^10; % Número de experimentos
points = rand(n,i).*2-1; 

NOTINRANGE = zeros(1,i);
INRANGE = zeros(1,i);

for l = 1:i
    if sum(points(:,l).^2)<=1
        INRANGE(l) = 1;
    else
        NOTINRANGE(l) = 1;
    end
end

Ratio= sum(INRANGE)./i;
AreaSphere = Ratio*2^n;
VolAnalitico = [1,2,pi,4/3*pi,pi.^2/2,8*pi.^2/15,pi.^3/6,pi.^3*16/105,pi.^4/24,pi.^4*32/945,pi.^5/120,64*pi^5/10395,pi^6/720];

% Display
disp("Volumen de una esfera de "+string(n)+" dimensiones")
disp("Volumen analítico: "+string(VolAnalitico(n+1)))
disp("Monte Carla: "+string(AreaSphere))
disp("Número de experimentos: "+string(i))
