export imr, Gimr

"""
x = [x₁ x₂ x₃ x₄ x₅ x₆]' 

The incidence function for a triangular mesh element.
A(x) = [x₃ - x₁   x₅ - x₁; \
        x₄ - x₂     x₆ - x₂];
"""
function A(X::AbstractMatrix)
    return [X[:,2] - X[:,1] X[:,3] - X[:,1]]
end

function A(x₁::AbstractVector, x₂::AbstractVector, x₃::AbstractVector)
    return [x₂ - x₁ x₃ - x₁]
end

function A(x::AbstractVector)
    x₁ = x[1:2]
    x₂ = x[3:4]
    x₃ = x[5:6]

    return A(x₁, x₂, x₃)
end

function imr(X::Union{AbstractMatrix, AbstractVector}, p=0; triangle_type = :isoscoles)
    w = [0 1 0 ; 0 0 1]
    if (triangle_type == :equilateral)
        w = [0 1 0.5 ; 0 0 sqrt(3)/2]
    end

    temp = A(X)*inv(A(w))
    return tr(temp'*temp) / (2 * abs(det(temp)))
end

function Gimr(X::AbstractVector, p=0; triangle_type = :isoscoles)
    return ForwardDiff.gradient(X -> imr(X, triangle_type=triangle_type), X)
end

function imr(x₁::AbstractVector, x₂::AbstractVector, x₃::AbstractVector, p=0; triangle_type = :isoscoles)
    return imr([x₁ x₂ x₃], triangle_type=triangle_type)
end

function Himr(X::AbstractVector, p=0; triangle_type = :isoscoles) 
    return ForwardDiff.hessian(X -> imr(X, triangle_type=triangle_type), X)
end