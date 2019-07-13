Rails.application.routes.draw do
  #home/root path
  root to: "home#index"
  
  #home pages
  get 'home/index'
  get 'home/about'
  get 'home/scrape'
  
  #tier pages
  get 'tier/discord'
  get 'tier/harmony'
  
  #legacy pages
  get 'legacy/one'
  get 'legacy/two'
  
  #team pages
  get 'team/aimbots'
  get 'team/alt_f4'
  get 'team/careless_pandas'
  get 'team/comets'
  get 'team/ddos'
  get 'team/eclipse'
  get 'team/elusion'
  get 'team/fighting_potatoes'
  get 'team/frantic_lavacats'
  get 'team/gravity'
  get 'team/harmony_in_chaos'
  get 'team/holy_jalapenos'
  get 'team/instaloch'
  get 'team/invictus'
  get 'team/jetpack_cats'
  get 'team/karma'
  get 'team/kommit'
  get 'team/maelstrom'
  get 'team/majesty_ruby'
  get 'team/meteors'
  get 'team/minty_hippos'
  get 'team/otaku'
  get 'team/overtime'
  get 'team/pacified_pythons'
  get 'team/prodigious'
  get 'team/renovatio'
  get 'team/snowday'
  get 'team/spare_change'
  get 'team/sugar_rush'
  get 'team/tough_luck'
  get 'team/unded_battery'
  get 'team/vitamin_c'
  
  #for login/logoff/registration
  devise_for :users
end