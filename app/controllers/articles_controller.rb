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
    # Used on the first time the form is displayd to avoid sending nill
    # To the validadion check so @article.errors.any? is return false.
    @article = Article.new
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

end