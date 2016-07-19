Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: 'merchants_search#show'
          get 'find_all', to: 'merchants_search#index'
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: 'transactions_search#show'
          get 'find_all', to: 'transactions_search#index'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: 'customers_search#show'
          get 'find_all', to: 'customers_search#index'
        end
      end

    end
  end
end
