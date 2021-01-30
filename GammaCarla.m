% Datos iniciales
z = 40;
n = 50000; % número de experimentos
if z<1 
   x = linspace(0.0001,100,n);
else
   x= linspace(0,100,n);
end
G = x.^(z-1).*exp(-x);

% Monte Carla
xp = rand(1,n)*100; 
yp = rand(1,n)*max(G);
ygamma =xp.^(z-1).*exp(-xp);

NOTINRANGE= yp>ygamma;
INRANGE= yp<=ygamma;

Ratio= sum(INRANGE)/n;
AreaSquare=x(end)*max(G);
AreaGamma=AreaSquare*Ratio;

% Integración Numérica
h=x(2)-x(1);
I = trapz(G*h);

% Plots
plot(x,G)
hold on
plot(xp,yp.*INRANGE,'.','Color',[.24,.92,.73])
plot(xp,yp.*NOTINRANGE,'.')
hold off

% Display
disp("Gamma "+string(z))
disp("Número de experimentos:"+string(n))
disp("Integral Numérica:"+string(I))
disp("Función Gamma:"+string(gamma(z)))
disp("Monte Carla:"+string(AreaGamma))