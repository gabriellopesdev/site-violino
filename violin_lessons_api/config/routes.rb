Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    namespace :v1 do
      post "login", to: "auth#login"
      get "profile", to: "auth#profile"
      resources :users
      resources :lessons
      resources :forum_posts
      resources :forum_topics
      resources :live_lesson_schedules
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
