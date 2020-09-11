Rails.application.routes.draw do
  root 'pages#home'
  get "about", to: "pages#about"
  # :show GET /articles/:id Displays an article
  # :index GET /articles Displays a list of the articles
  # :new GET /articles/new Displays the form to create a new article
  # :create POST /articles Save the article caming from the form in the database
  # :edit GET /articles/:id/edit Displays the form to edit a specific article
  # :update PATCH /articles/:id Update the article caming from the form in the database
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end
