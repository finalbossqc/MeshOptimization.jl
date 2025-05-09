module MeshOptimization

using Pkg
Pkg.activate(".")

using LinearAlgebra

include("imr.jl")
include("objectives.jl")
include("optimize.jl")
end