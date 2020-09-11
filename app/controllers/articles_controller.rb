class ArticlesController < ApplicationController
  # Perform the action set_article before the execution of each method in
  # in the only array
  before_action :set_article, only: [:show,:edit, :update, :destroy]

  # Displays a specific article
  def show
  end

  # List all articles
  def index
    @articles = Article.all
  end

  # Displays the form to create a new article
  def new
    # Used on the first time the form is displayd to avoid sending nill
    # To the validadion check so @article.errors.any? is return false.
    @article = Article.new
  end

  # Displays and form to update an article
  def edit
  end

  # Save the new article in the databbase
  def create
    # Require the top level atribute article and permit only the title and Description
    # from it.
    # It is a security feature included at rails 4
    @article = Article.new(params.require(:article).permit(:title, :description))
    # if to validate if the save was sucessful
    if @article.save
      # used to display a success mesage in the show page
      # :notice to be success full
      flash[:notice] = "Article was created successfully"
      # Specify where the browser should go after the article is saved
      # Rails will extract the id from @article and redirect to the show path.
      # Since the show path is /articles/:id

      # redirect_to article_path(@article)

      # Shortened the previous redirect_to
      redirect_to @article
    else
      # render the new form again
      render "new"
    end

  end

  # How create looks like without the comments
  # def create
  #   @article = Article.new(params.require(:article).permit(:title, :description))
  #   if @article.save
  #     redirect_to @article
  #   else
  #     render 'new'
  #   end
  # end

  # Save the edited article to the database
  def update
    # Update the article
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] ="Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # All methods bellow it are private methods
  private

  def set_article
    # Query paramenters from the page request
    # Are avaible at the params hash
    # @ will convert the variable to be an instance variable
    @article = Article.find(params[:id])
  end

end
