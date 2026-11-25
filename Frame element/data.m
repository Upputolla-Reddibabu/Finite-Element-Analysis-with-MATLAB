% given data 
E = 70e6; I = 16e-6; A = 8e-3; P = 1000;  w = 500;  % UDL N/m

L1 = 0.2; L2= 0.5; L3 = 0.08;  % Element lenghts

% Element 1
x1 = [0,0,0,L2];

k1 = ele_stiff(E,A,I,x1)
f1 = ele_load(0,w,x1) % udl is applied on the ele

% Element 2
x2 = [0,L2,L1/2,L2+L3/2];
k2 = ele_stiff(E,A,I,x2)

% Element 3
x3 = [L1/2,L2+L3/2,L1,L2+L3];
k3 = ele_stiff(E,A,I,x3)

% Assembly
K_global = zeros(12,12);
F = zeros(12,1);

K_global(1:6,1:6) = k1(1:6,1:6);
K_global(4:9,4:9) = K_global(4:9,4:9) + k2(1:6,1:6);
K_global(7:12,7:12) = K_global(7:12,7:12) + k3(1:6,1:6)

F(1:6) = f1(1:6);
F(5) = F(5) - 2*P;
F(8) = F(8) - 4*P;
F

% Boundary Conditions Imposition
K_reduce = K_global(4:9,4:9);
F_reduce = F(4:9);

% Finding Solution
u_reduce = inv(K_reduce)*F_reduce

% Finding reactions forces 
u = [0;0;0;u_reduce;0;0;0]
F_total = K_global * u

xy = [0 0; 0 L2; L1/2 L2+L3/2; L1 L2+L3];
plot(xy(:,1),xy(:,2),'b--o', xy(:,1)+50*u(1:3:end),xy(:,2)+50*u(2:3:end),'r-o'); axis equal; grid on; legend('Undeformed','Deformed x50')





