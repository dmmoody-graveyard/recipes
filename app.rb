ENV['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/recipes') do
  name = params.fetch('name')
  @recipe = Recipe.new({:name => name})
  @recipe.save()
  @recipes = Recipe.all()
  erb(:index)
end
