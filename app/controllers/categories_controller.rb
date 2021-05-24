class CategoriesController < ApplicationController
  before_action :authorize_request
  def create
    @category = Category.new(name)
  end

  def destroy
    @category = Category.find(params[:id])
  end
end
