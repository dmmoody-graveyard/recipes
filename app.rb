require('bundler/setup')
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

post('/recipes') do
  name = params.fetch('name')
  @recipe = Recipe.new({:name => name})
  @recipe.save()
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

post('/categories') do
  name = params.fetch('name')
  @category = Category.new({:name => name})
  @category.save()
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @categories = Category.all()
  erb(:recipe)
end

post('/recipes/:id') do
  category = params.fetch("category")
  @recipe = Recipe.find(params.fetch("id").to_i())
  category = Category.find_by_name(category)
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:category_id => category.id})
  binding.pry
  @categories = Category.all()
  erb(:recipe)
end
