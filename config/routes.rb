Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
        resources :random, only: [:index]
        resources :search, only: [:index, :show]
      end
      resources :transactions, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :random, only: [:index]
        resources :search, only: [:index, :show]
      end
      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :transactions, only: [:index]
        resources :random, only: [:index]
        resources :search, only: [:index, :show]
      end
      resources :invoices, only: [:index, :show] do
        resources :customers, only: [:index]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        resources :transactions, only: [:index]
        resources :merchants, only: [:index]
        resources :random, only: [:index]
        resources :search, only: [:index, :show]
      end
      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index]
        resources :merchants, only: [:index]
        resources :random, only: [:index]
        resources :search, only: [:index, :show]
      end
      resources :invoice_items, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
        resources :random, only: [:index]
        resources :search, only: [:index, :show]
      end
    end
  end
end
