using NeuralVerification, LazySets, GLPKMathProgInterface
using Test

# comment to re-enable assertion checks
LazySets.deactivate_assertions()
LazySets.Assertions.deactivate_assertions(NeuralVerification)

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

include("identity_network.jl")
include("relu_network.jl")
include("inactive_relus.jl")
if Base.find_package("Flux") != nothing
    include("flux.jl")
end
include("complements.jl")
