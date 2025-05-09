x₁ = [0.0 ; 0.0]
x₂ = [1.0 ; 0.0]
x₃ = [0.0 ; 1.2]
X₁ = [x₁ ; x₂ ; x₃]

sol = optimize(X₁);

@assert abs(IMR_obj(sol) - 1.0) < 1e-6