X = [0 1 0 ; 0 0 1]
@test imr(X) == 1.0

x₁ = [0 ; 0]
x₂ = [1 ; 0]
x₃ = [0 ; 1]
X = [x₁ x₂ x₃]
@test imr(x₁, x₂, x₃) == imr(X)

Y = [x₁ ; x₂ ; x₃]
@test imr(Y) == imr(X)