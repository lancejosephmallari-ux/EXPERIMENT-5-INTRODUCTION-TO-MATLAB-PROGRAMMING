%PART A

% Matrix R 
R = [ 5 -2  0  7;
    1  3 -4  2;
    6  0  8 -1];

R

% Matrix R transpose forms
Transpose_R = transpose(R)

R_Apostrophe = R'

R_Dot_Apostrophe = R.'

% Matrix Z 
Z = [ 2+3i  -1+4i   5-2i; -3+1i   6      2+5i];
Z

% Matrix Z transpose forms
Transpose_Z = transpose(Z)

Z_Apostrophe = Z'

Z_Dot_Apostrophe = Z.'



%PART B

% Coefficient matrix A  
A = [ 2 -1  3  2;
    1  4 -2  1;
    3  2  1 -1;
    -2  3  4  2];
A

% Right-hand-side vector b.
b = [16; -7; 6; 7];
b

% Determinant A
detA = det(A)

% Inverse Method
x_inv = inv(A) * b;
x_inv

% Cramer's Rule
A1 = A; A1(:, 1) = b;
A2 = A; A2(:, 2) = b;
A3 = A; A3(:, 3) = b;
A4 = A; A4(:, 4) = b;

A1
detA1 = det(A1)

A2
detA2 = det(A2)

A3
detA3 = det(A3)

A4
detA4 = det(A4)

x_cramer = [det(A1); 
    det(A2); 
    det(A3); 
    det(A4)] / det(A);
x_cramer

% Numerical precision
normdiff = norm(x_inv-x_cramer)
normprod = norm(A * x_inv - b)