using Optimization, OptimizationOptimJL
using ADTypes

export optimize

function optimize(X₀::AbstractVector; include_imr=1)
    f = OptimizationFunction((X,p) -> IMR_obj(X,p)*include_imr, grad=G_IMR_obj!, hess=H_IMR_obj!)
    prob = OptimizationProblem(f, X₀, 0.0)
    return solve(prob, LBFGS())
end