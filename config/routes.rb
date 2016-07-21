Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]

        get 'find', to: 'merchants/search#show', :on => :collection
        get 'find_all', to: 'merchants/search#index', :on => :collection
        get 'random', to: 'merchants/random#index', :on => :collection
        get ':id/revenue', to: 'merchants/revenue#show', :on => :collection
        get 'revenue', to: 'merchants/revenue#index', :on => :collection
        get 'date', to: 'merchants/revenue_date#show', :on => :member
        get 'most_items', to: 'merchants/most_items#index', :on => :collection
        get ':id/customers_with_pending_invoices', to: 'merchants/pending_invoices#index', :on => :collection
        get ':id/favorite_customer', to: 'merchants/favorite_customer#index', :on => :collection
      end

      resources :transactions, only: [:index, :show] do
        resources :invoices, only: [:index]

        get '/invoice', to: 'transactions/invoice#index', :on => :member
        get 'find', to: 'transactions/search#show', :on => :collection
        get 'find_all', to: 'transactions/search#index', :on => :collection
        get 'random', to: 'transactions/random#index', :on => :collection
      end

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :transactions, only: [:index]

        get 'find', to: 'customers/search#show', :on => :collection
        get 'find_all', to: 'customers/search#index', :on => :collection
        get 'random', to: 'customers/random#index', :on => :collection
        get 'favorite_merchant', to: 'customers/favorite_merchant#show', :on => :member
      end

      resources :invoices, only: [:index, :show] do
        resources :items, only: [:index]
        resources :transactions, only: [:index]
        resources :merchants, only: [:index]

        get 'find', to: 'invoices/search#show', :on => :collection
        get 'find_all', to: 'invoices/search#index', :on => :collection
        get 'random', to: 'invoices/random#index', :on => :collection
        get '/customer', to: 'invoices/customer#index', :on => :member
        get '/merchant', to: 'invoices/merchant#index', :on => :member
        get '/invoice_items', to: 'invoices/invoice_items#index', :on => :member

      end

      resources :items, only: [:index, :show] do
        get 'find', to: 'items/search#show', :on => :collection
        get 'find_all', to: 'items/search#index', :on => :collection
        get 'random', to: 'items/random#index', :on => :collection
        get '/merchant', to: 'items/merchant#index', :on => :member
        get '/invoice_items', to: 'items/invoice_items#index', :on => :member
        get 'most_items', to: 'items/most_items#index', :on => :collection
        get 'best_day', to: 'items/best_day#show', :on => :member
      end

      resources :invoice_items, only: [:index, :show] do
        get 'find', to: 'invoice_items/search#show', :on => :collection
        get 'find_all', to: 'invoice_items/search#index', :on => :collection
        get 'random', to: 'invoice_items/random#index', :on => :collection
        get '/item', to: 'invoice_items/item#index', :on => :member
        get '/invoice', to: 'invoice_items/invoice#index', :on => :member
      end
    end
  end
end
