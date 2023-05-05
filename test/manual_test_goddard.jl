using CTDirect
using CTBase
using CTProblems


# simple integrator - time min
prob = Problem(:goddard, :classical)
ocp = prob.model
init = [1.01, 0.05, 0.8, 0.1]

println("Midpoint")
sol = solve(ocp, grid_size=50, print_level=5, tol=1e-12, init=init, rk_method=:midpoint)
p1 = plot(sol)

println("Trapeze")
sol = solve(ocp, grid_size=50, print_level=5, tol=1e-12, init=init, rk_method=:trapeze)
p2 = plot(sol)

println("Gauss2")
sol = solve(ocp, grid_size=50, print_level=5, tol=1e-12, init=init, rk_method=:gauss2)
p3 = plot(sol)

plot([p1,p2,p3], layout =(3,1))