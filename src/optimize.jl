using Optimization, OptimizationOptimJL
using ADTypes

export optimize

function optimize(X₀::AbstractVector; include_imr=true)
    f = OptimizationFunction(IMR_obj, grad=G_IMR_obj!, hess=H_IMR_obj!)
    prob = OptimizationProblem(f, X₀, 0.0)
    return solve(prob, LBFGS())
end