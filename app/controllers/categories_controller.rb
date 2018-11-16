class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @category = Category.all
  end

  def show

  end

  def create
  end

  def update
  end

  def destroy
  end

end
