Mig::Application.routes.draw do
  resources :campaigns, :only => [:index, :show] do
    resource :candidates, :only => [:index, :show]
  end

  root :to => "campaigns#index"
end
