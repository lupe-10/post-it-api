class CategoriesController < ApplicationController
  def create
    @category = Category.new(name)
  end

  def destroy
    @category = Category.find(params[:id])
  end
end
