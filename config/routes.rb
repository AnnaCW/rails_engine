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

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: 'invoices_search#show'
          get 'find_all', to: 'invoices_search#index'
        end
        member do
          get 'transactions', to: 'invoices_transactions#index'
          get 'invoice_items', to: 'invoices_invoice_items#index'
          get 'items', to: 'invoices_items#index'
          get 'customer', to: 'invoices_customer#show'
          get 'merchant', to: 'invoices_merchant#show'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'find', to: 'items_search#show'
          get 'find_all', to: 'items_search#index'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: 'invoice_items_search#show'
          get 'find_all', to: 'invoice_items_search#index'
        end
      end
    end
  end
end
