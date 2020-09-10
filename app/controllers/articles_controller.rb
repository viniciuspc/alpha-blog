class ArticlesController < ApplicationController
  def show
    # Query paramenters from the page request
    # Are avaible at the params hash
    # @ will convert the variable to be an instance variable
    @article = Article.find(params[:id])
  end
end
