require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @action = "Square"
  @input = params.fetch("number").to_i
  @result = @input ** 2
  @back_link = "/square/new"
  @back_link_text = "Calculate another square"
  erb(:results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @action = "Square Root"
  @input = params.fetch("number").to_i
  @result = Math.sqrt(@input)
  @back_link = "/square_root/new"
  @back_link_text = "Calculate another square root"
  erb(:results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @action = "Payment"
  @apr = (params.fetch("apr").to_f / 100) / 12
  @loan_term = params.fetch("years").to_i * 12
  @principal = params.fetch("principal").to_f
  @numerator = @apr * @principal
  @denominator = 1 - ((1 + @apr) ** -@loan_term)
  @result = (@numerator/@denominator)
  @back_link = "/payment/new"
  @back_link_text = "Calculate another payment"
  erb(:results)
end

get("/random/new") do
  @min = params.fetch("user_min").to_i
  @max = params.fetch("user_max").to_i
  @result = rand(@min..@max) 
end
