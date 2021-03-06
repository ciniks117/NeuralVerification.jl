using NeuralVerification, LazySets, GLPKMathProgInterface
using Test

import NeuralVerification: ReLU, Id

macro no_error(ex)
    quote
        try $(esc(ex))
            true
        catch e
            @error(e)
            false
        end
    end
end

# comment to disable assertion checks
#LazySets.deactivate_assertions()
#LazySets.Assertions.deactivate_assertions(NeuralVerification)

include("identity_network.jl")
include("relu_network.jl")
#include("inactive_relus.jl")
@warn "skipping inactive_relus tests"
if Base.find_package("Flux") != nothing
    include("flux.jl")
end

@warn "skipping complements tests"
#include("complements.jl")
