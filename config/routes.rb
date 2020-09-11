Rails.application.routes.draw do
  root 'pages#home'
  get "about", to: "pages#about"
  # :show GET /articles/:id Displays an article
  # :index GET /articles Displays a list of the articles
  # :new GET /articles/new Displays the form to create a new article
  # :create POST /articles Save the article caming from the form in the databbase
  resources :articles, only: [:show, :index, :new, :create]
end
