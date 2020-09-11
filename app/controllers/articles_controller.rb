class ArticlesController < ApplicationController
  # Displays a specific article
  def show
    # Query paramenters from the page request
    # Are avaible at the params hash
    # @ will convert the variable to be an instance variable
    @article = Article.find(params[:id])
  end

  # List all articles
  def index
    @articles = Article.all
  end

  # Displays the form to create a new article
  def new
  end

  # Save the new article in the databbase
  def create
    render plain: params[:article]
  end
end
