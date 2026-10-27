clc;
clear;
close all;

% =========================================================================
% PROBLEM A: TRANSPOSE OPERATIONS
% =========================================================================

% 1. Define real matrix R and complex matrix Z
R = [ 5, -2,  0,  7; ...
      1,  3, -4,  2; ...
      6,  0,  8, -1 ];

Z = [ 2+3i, -1+4i, 5-2i; ...
     -3+1i,     6, 2+5i ];

% --- Transpose Operations on Real Matrix R ---
disp('=== PROBLEM A: REAL MATRIX R TRANSPOSE OPERATIONS ===');
disp('transpose(R):');
disp(transpose(R));

disp('R'':');
disp(R');

disp('R.'':');
disp(R.');

% --- Transpose Operations on Complex Matrix Z ---
disp('=== PROBLEM A: COMPLEX MATRIX Z TRANSPOSE OPERATIONS ===');
disp('transpose(Z):');
disp(transpose(Z));

disp('Z'':');
disp(Z');

disp('Z.'':');
disp(Z.');

% =========================================================================
% ANSWERS TO PROBLEM A QUESTIONS
% =========================================================================
% a. Which operations give identical results for the real matrix R?
%    Answer: All three operations - transpose(R), R', and R.' - produce 
%    identical results for the real matrix R.
%
% b. Which two operations give identical results for the complex matrix Z?
%    Answer: transpose(Z) and Z.' produce identical results for the complex 
%    matrix Z.
%
% c. What additional operation is performed by the apostrophe operator 
%    when the matrix contains complex entries?
%    Answer: The apostrophe operator (') performs complex conjugation on 
%    each entry in addition to transposing the matrix rows and columns 
%    (forming the complex-conjugate transpose).
% =========================================================================

%% =========================================================================
% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
% =========================================================================

disp('=== PROBLEM B: LINEAR SYSTEM SOLUTIONS AND CHECKS ===');

% Define the coefficient matrix A and right-hand-side vector b
A = [ 2, -1,  3,  2; ...
      1,  4, -2,  1; ...
      3,  2,  1, -1; ...
     -2,  3,  4,  2 ];

b = [ 16; ...
      -7; ...
       6; ...
       7 ];

% --- Method 1: Inverse Method ---
% Compute solution using the inverse of matrix A
x_inv = inv(A) * b;

% --- Method 2: Cramer's Rule ---
% Compute solution by replacing one column of A at a time with vector b
n = length(b);
x_cramer = zeros(n, 1);
det_A = det(A);

for j = 1:n
    A_temp = A;
    A_temp(:, j) = b;
    x_cramer(j) = det(A_temp) / det_A;
end

% --- Display Solution Vectors and Determinant ---
disp('Coefficient Matrix A:');
disp(A);

disp('Right-Hand-Side Vector b:');
disp(b);

disp('Solution via Inverse Method (x_inv):');
disp(x_inv);

disp('Solution via Cramer''s Rule (x_cramer):');
disp(x_cramer);

disp('Determinant of Matrix A, det(A):');
disp(det_A);

% --- Required Numerical Precision Checks ---
norm_diff = norm(x_inv - x_cramer);
norm_residual = norm(A * x_inv - b);

disp('--- Numerical Precision Checks ---');
fprintf('norm(x_inv - x_cramer) = %e\n', norm_diff);
fprintf('norm(A*x_inv - b)     = %e\n', norm_residual);
