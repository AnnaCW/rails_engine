Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]

        get 'find', to: 'merchants/search#show', :on => :collection
        get 'find_all', to: 'merchants/search#index', :on => :collection
        get 'random', to: 'merchants/random#index', :on => :collection
      end

      resources :transactions, only: [:index, :show] do
        resources :invoices, only: [:index]

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
      end

      resources :invoices, only: [:index, :show] do
        resources :customers, only: [:index]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        resources :transactions, only: [:index]
        resources :merchants, only: [:index]

        get 'find', to: 'invoices/search#show', :on => :collection
        get 'find_all', to: 'invoices/search#index', :on => :collection
        get 'random', to: 'invoices/random#index', :on => :collection
      end

      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index]
        resources :merchants, only: [:index]

        get 'find', to: 'items/search#show', :on => :collection
        get 'find_all', to: 'items/search#index', :on => :collection
        get 'random', to: 'items/random#index', :on => :collection
      end
      
      resources :invoice_items, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]

        get 'find', to: 'invoice_items/search#show', :on => :collection
        get 'find_all', to: 'invoice_items/search#index', :on => :collection
        get 'random', to: 'invoice_items/random#index', :on => :collection
      end
    end
  end
end
