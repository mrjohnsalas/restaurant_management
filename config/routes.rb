Rails.application.routes.draw do

  resources :contacts

  resources :abouts

  resources :orders do
    resources :order_details
    resources :order_deliveries  
    resources :order_cards
  end

  resources :payment_types

  root 'welcome#index'

  resources :restaurants do
    member do
      put "like", to: "restaurants#upvote"
      put "dislike", to: "restaurants#downvote"
    end
    resources :items do
      member do
        put "like", to: "items#upvote"
        put "dislike", to: "items#downvote"
      end
      resources :user_reviews
    end
    resources :locals do
      resources :local_photos
      resources :local_deliveries
      resources :local_cards
      resources :menus do 
        collection do
          get "shop"
          put "add_to_shopping_cart"
        end
      end
    end
    resources :user_reviews
  end

  resources :user_addresses
  resources :user_cards
  resources :user_points  
  devise_for :users

  resources :credit_card_types
  resources :food_categories
  resources :item_categories
  resources :user_types
  resources :object_types
  resources :shopping_carts

  resources :countries do
	  resources :provinces	do
	    resources :districts
	  end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
