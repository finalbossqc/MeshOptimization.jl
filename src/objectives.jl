using ForwardDiff

export IMR_obj, G_IMR_obj, G_IMR_obj!, H_IMR_obj, H_IMR_obj!

function IMR_obj(x::AbstractVector, p=0; triangle_type=:isoscoles)
    val = imr(x, triangle_type=triangle_type)
    return val
end

function G_IMR_obj(x::AbstractVector, p=0; triangle_type=:isoscoles)
    val = Gimr(x, p, triangle_type=triangle_type)
    return val
end

function G_IMR_obj!(G::AbstractVector, x::AbstractVector, p=0; triangle_type = :isoscoles)
    G .= Gimr(x, p, triangle_type=triangle_type)
end

function H_IMR_obj(X::AbstractVector, p=0; triangle_type=:isoscoles)
    val = Himr(X, p, triangle_type=triangle_type)
    return val
end

function H_IMR_obj!(H::AbstractMatrix, X::AbstractVector, p=0; triangle_type=:isoscoles)
    H .= Himr(X, p, triangle_type=triangle_type)
end