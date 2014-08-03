PageTree::Engine.routes.draw do
  get '/', to: 'pages#show'
  get :edit, to: 'pages#edit'
  get :new, to: 'pages#new'
  
  patch '/', to: 'pages#update'
  put '/', to: 'pages#update'
  delete '/', to: 'pages#destroy'
  post '/', to: 'pages#create'
end
