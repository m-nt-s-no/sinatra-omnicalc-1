require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:layout) do
    #nested erb idea from: https://levelup.gitconnected.com/yield-in-yield-in-ruby-erb-for-sinatra-web-app-37d445363afe
    #but leads to double header :(
    erb(:square_new)
  end
end

get("/square/new") do
  @input = params.fetch("user_number").to_i
  @square = @input ** 2

end

get("/square_root/new") do
  @input = params.fetch("user_number").to_i
  @square = @input ** (1/2)
end

get("/payment/new") do
  @apr = (params.fetch("user_apr").to_f / 100) / 12
  @loan_term = params.fetch("user_years").to_i * 12
  @principal = params.fetch("user_principal").to_f
  @numerator = @apr * @principal
  @denominator = 1 - ((1 + @apr) ** -@loan_term)
  @payment = (@numerator/@denominator).to_fs(:currency, { :precision => 2 })
end

get("/random/new") do
  @min = params.fetch("user_min").to_i
  @max = params.fetch("user_max").to_i
  @rand_num = rand(@min..@max) 
end
