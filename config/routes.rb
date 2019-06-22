Rails.application.routes.draw do
  #home/root path
  root to: "home#index"
  
  #individual pages
  get 'home/index'
  get 'home/about'
  get 'home/scrape'
  get 'tier/discord'
  get 'tier/harmony'
  get 'legacy/one'
  get 'legacy/two'
  
  #for login/logoff/registration
  devise_for :users
end
