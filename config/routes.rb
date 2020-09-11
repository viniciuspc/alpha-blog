Rails.application.routes.draw do
  root 'pages#home'
  get "about", to: "pages#about"
  # :show GET /articles/:id Displays an article
  # :index GET /articles Displays a list of the articles
  # :new GET /articles/new Displays the form to create a new article
  # :create POST /articles Save the article caming from the form in the database
  # :edit GET /articles/:id/edit Displays the form to edit a specific article
  # :update PATCH /articles/:id Update the article caming from the form in the database
  # :destroy DELETE /articles/:id Delete and specific article from the database
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  # Expose all the routes for articles
  # resources provides all REST-ful routes to Rails resources. (In this case article is the resource)
  # REST - Representational state transfer - mapping HTTP verbs (get, post,
  # put/patch, delete) to CRUD actions
  resources :articles
end
