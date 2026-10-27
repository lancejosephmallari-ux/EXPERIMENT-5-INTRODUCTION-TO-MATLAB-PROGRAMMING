---
# EXPERIMENT-5-INTRODUCTION-TO-MATLAB-PROGRAMMING
---
### Name: Lance Joseph N. Mallari

### Section: 2ECE-A

### Date: 10/27/26

---
### I. Intended Learning Outcomes

At the end of this laboratory activity, the student should be able to:
1. create real and complex matrices in MATLAB;
2. distinguish transpose from complex-conjugate transpose operations;
3. express a simultaneous linear system in matrix form; and
4. solve and check a linear system using the inverse method and Cramer’s Rule.

### II. Instructions
Write a MATLAB script containing clearly labeled sections for both problems. Display the requested
matrices and numerical checks. Use MATLAB matrix operations and built-in functions; do not type
a computed answer directly into the output.

### III. Programming Problems
A. TRANSPOSE OPERATIONS

Define the following matrices exactly as shown:

```
R = | 5 -2  0  7 |
    | 1  3 -4  2 |
    | 6  0  8 -1 |

Z = | 2+3i -1+4i  5-2i |
    |-3+1i     6  2+5i |
```
For each matrix, compute and display all three expressions:
```
transpose(A)
A’
A.’
```
---
# A. CODING AND BREAKDOWN OF CODE

### CODE:
1. Define real matrix R and complex matrix Z
```
% Matrix R:

R = [ 5 -2  0  7;
    1  3 -4  2;
    6  0  8 -1];
R

% Matrix R Transpose Forms:

Transpose_R = transpose(R)
R_Apostrophe = R'
R_Dot_Apostrophe = R.'


% Matrix Z:

Z = [ 2+3i  -1+4i   5-2i; -3+1i   6      2+5i];
Z

% Matrix Z Transpose Forms:

Transpose_Z = transpose(Z)
Z_Apostrophe = Z'
Z_Dot_Apostrophe = Z.'
```
### OUTPUT:
```
R = 3×4
     5     -2      0      7
     1      3     -4      2
     6      0      8     -1


Transpose_R = 4×3
      5      1      6
     -2      3      0
      0     -4      8
      7      2     -1


R_Apostrophe = 4×3
      5      1      6
     -2      3      0
      0     -4      8
      7      2     -1


R_Dot_Apostrophe = 4×3
      5      1      6
     -2      3      0
      0     -4      8
      7      2     -1


Z = 2×3 complex
      2.0000 + 3.0000i     -1.0000 + 4.0000i     5.0000 - 2.0000i
     -3.0000 + 1.0000i      6.0000 + 0.0000i     2.0000 + 5.0000i


Transpose_Z = 3×2 complex
      2.0000 + 3.0000i     -3.0000 + 1.0000i
     -1.0000 + 4.0000i      6.0000 + 0.0000i
      5.0000 - 2.0000i      2.0000 + 5.0000i


Z_Apostrophe = 3×2 complex
      2.0000 - 3.0000i     -3.0000 - 1.0000i
     -1.0000 - 4.0000i      6.0000 + 0.0000i
      5.0000 + 2.0000i      2.0000 - 5.0000i


Z_Dot_Apostrophe = 3×2 complex
      2.0000 + 3.0000i     -3.0000 + 1.0000i
     -1.0000 + 4.0000i      6.0000 + 0.0000i
      5.0000 - 2.0000i      2.0000 + 5.0000i
```
Code Breakdown per line:
- `R = [...]`: This defines the real 3 x 4 matrix R.
- `,`: or spaces count as the separation between elements within the matrix.
-  `;`: separates the matrix rows.
-  `transpose(R)`,`R'`, `R.'`: transposes matrix R.
-  `Z = [...]`: Defines the 2 x 3 complex matrix Z using MATLAB's built-in imaginary unit.
-  `transpose(Z)`,`Z'`, `Z.'`: transposes matrix Z.

---
# Q and A for PART A:
where A is replaced by R and then by Z.
Answer the following in MATLAB comments below your output:
a. Which operations give identical results for the real matrix R?

`Answer: All three operations — transpose(R), R', and R.' all produce identical results for the real matrix R.`

b. Which two operations give identical results for the complex matrix Z?

`Answer: transpose(Z) and Z.' both produce identical results for the complex matrix Z.`

c. What additional operation is performed by the apostrophe operator ’ when the matrix contains
complex entries?

`Answer: The apostrophe operator (') performs complex conjugation on each entry in addition to transposing the matrix rows and columns (forming the complex-conjugate transpose).`


---
Create the coefficient matrix A and right-hand-side vector b. Then compute the solution in two ways.

1. Inverse method: compute x inv using the inverse of A.
2. Cramer’s Rule: replace one column of A at a time with b, use determinants, and store the result in x cramer. A loop is optional.

Do not use MATLAB’s left-division operator as either of the two required methods.

Required checks: Display both solution vectors and det(A). Also display norm(x inv-x cramer) and norm(A*x inv-b). The determinant must be nonzero. Both norm checks should be approximately zero to numerical precision.

# B. CODING AND BREAKDOWN OF CODE
```
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
```
