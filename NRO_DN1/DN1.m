%Naloga 1.
podatki = importdata("C:\Users\blazb\Downloads\NRO_DN1\naloga1_1.txt",";",2);
 t= podatki.data(:,1);

 %%
 % Naloga 2.


fid = fopen("naloga1_2.txt","r");
line = {}
while ~feof(fid)
    line{end+1} = fgetl(fid);
end
fclose(fid)

n =length(line);
P = zeros(1,n);

for i = 1:n
    P(i)=str2double(line{i});
end
P = P(~isnan(P));
figure(1)
plot(t,P,'r',LineWidth=1.5);
xlabel('t [s]');
ylabel('P[W]');
title('graf P(t)');

%%

%Naloga 3

num_points = 10000;
tmin = min(t);
tmax = max(t);
pmin = 0;
pmax = max(P)*1.1;
area = (tmax-tmin)*(pmax-pmin);

points_t = tmin+(tmax-tmin)*rand(num_points,1);
points_p = pmin + (pmax - pmin) * rand(num_points, 1);
p_at_points = interp1(t,P,points_t,'linear');
is_below = points_p<=p_at_points;
ratio = sum(is_below)/num_points;
integralP = ratio*area;

x = trapz(t,P);

N = length(P);

I = 0;

for i = 2:N
    I = I +(P(i-1) + P(i))*(t(i)-t(i-1))/2;
end

disp(I)
disp(x)
disp(integralP)