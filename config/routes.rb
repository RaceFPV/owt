Rails.application.routes.draw do
  #home/root path
  root to: "home#index"
  
  #home pages
  get 'home/index'
  get 'home/about'
  get 'home/scrape'
  get 'home/contact'
  
  #legacy pages
  get 'legacy/one'
  get 'legacy/two'
  get 'legacy/three'

  #other pages
  get 'home/maps'
  
end
