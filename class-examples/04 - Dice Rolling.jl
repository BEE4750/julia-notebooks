### A Pluto.jl notebook ###
# v0.16.4

using Markdown
using InteractiveUtils

# ╔═╡ 2b18fd9a-3a92-11ec-3ad8-2b5ae69f5f69
begin
	import Pkg
	Pkg.add("Distributions")
	using Distributions
end

# ╔═╡ b2627751-bf38-41c5-a43f-32e0663f6612
dice_dist = DiscreteUniform(1, 6)

# ╔═╡ 891ebd07-0617-4130-88af-0cf9df1a8762
function dice_roll_repeated(n_trials)
	roll_results = zeros(n_trials)
	for i=1:n_trials
		roll_results[i] = sum(rand(dice_dist, 4))
	end
	return roll_results
end

# ╔═╡ b6638c69-9fa4-478f-ada7-d6357c87792d
rolls = dice_roll_repeated(100000)

# ╔═╡ efb063af-182c-48ad-9682-91437a3dcac4
sum(rolls .== 19) / length(rolls) # calculate probability of 19

# ╔═╡ Cell order:
# ╠═2b18fd9a-3a92-11ec-3ad8-2b5ae69f5f69
# ╠═b2627751-bf38-41c5-a43f-32e0663f6612
# ╠═891ebd07-0617-4130-88af-0cf9df1a8762
# ╠═b6638c69-9fa4-478f-ada7-d6357c87792d
# ╠═efb063af-182c-48ad-9682-91437a3dcac4
