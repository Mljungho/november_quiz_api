Rails.application.routes.draw do
  namespace :api do
    resources :quizzes, only: [:create]
    resource :payments, only: [:create]
    # resources : payments do rails routes and compare => Wrapping in hard brackets allow to add more CRUD actions. for singular dont need hard bracket.
  end
end
