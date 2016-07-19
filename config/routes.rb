Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]

      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: 'customers_search#show'
          get 'find_all', to: 'customers_search#index'
        end
      end

    end
  end
end
