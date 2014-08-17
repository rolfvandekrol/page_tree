PageTree::Frontend::Engine.routes.draw do
  scope(module: 'page_tree/frontend') do
    get '/', to: 'pages#show'
    get :edit, to: 'pages#edit'
    get :new, to: 'pages#new'
    
    patch '/', to: 'pages#update'
    put '/', to: 'pages#update'
    delete '/', to: 'pages#destroy'
    post '/', to: 'pages#create'
    post :move_up, to: 'pages#move_up'
    post :move_down, to: 'pages#move_down'
  end
end
