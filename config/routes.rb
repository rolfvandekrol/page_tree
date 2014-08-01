PageTree::Engine.routes.draw do
  root to: 'pages#show'
  get :edit, to: 'pages#edit'
  patch :update, to: 'pages#update'
  put :update, to: 'pages#update'
  delete :destroy, to: 'pages#destroy'
  get :new, to: 'pages#new'
  post :create, to: 'pages#create'
end
