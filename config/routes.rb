Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: 'merchants_search#show'
          get 'find_all', to: 'merchants_search#index'
          get 'random', to: 'merchants_random#show'
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: 'transactions_search#show'
          get 'find_all', to: 'transactions_search#index'
          get 'random', to: 'transactions_random#show'
        end
        member do
          get 'invoice', to: 'transactions_invoice#show'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: 'customers_search#show'
          get 'find_all', to: 'customers_search#index'
          get 'random', to: 'customers_random#show'
        end
        member do
          get 'invoices', to: 'customers_invoices#show'
          get 'transactions', to: 'customers_transactions#show'
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: 'invoices_search#show'
          get 'find_all', to: 'invoices_search#index'
          get 'random', to: 'invoices_random#show'
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
          get 'random', to: 'items_random#show'
        end
        member do
          get 'invoice_items', to: 'items_invoice_items#index'
          get 'merchant', to: 'items_merchant#show'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: 'invoice_items_search#show'
          get 'find_all', to: 'invoice_items_search#index'
          get 'random', to: 'invoice_items_random#show'
        end
        member do
          get 'invoice', to: 'invoice_items_invoice#show'
          get 'item', to: 'invoice_items_item#show'
        end
      end
    end
  end
end
