%a)

A = [0 0 0 1]';
B = [0 0 1 0]';
C = [0 1 0 0]';
D = [1 0 0 0]';

AS = [0 0];
BS = [0 1];
CS = [1 0];
DS = [1 1];

% Matriz de pesos
W = (A*AS + B*BS + C*CS + D*DS);

SA = A'*W;
SB = B'*W;
SC = C'*W;
SD = D'*W;


%b)
AN = [0 0 1 1]';
BN = [1 0 1 0]';
CN = [0 1 1 0]';
DN = [1 1 1 0]';

ANS = [0 0];
BNS = [0 1];
CNS = [1 0];
DNS = [1 1];

WN = (AN*ANS + BN*BNS + CN*CNS + DN*DNS);

SAN = AN'*WN;
SBN = BN'*WN;
SCN = CN'*WN;
SDN = DN'*WN;
