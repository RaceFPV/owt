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
  
  #redirects
  get '/harmonyrosters', to: redirect('https://docs.google.com/spreadsheets/d/1a6gvHt-BPyViXasGsw6D_abziPXwAvHIJxIbDtcpNJ4/edit?usp=sharing'), :as => :harmonyrosters
  get '/discordrosters', to: redirect('https://docs.google.com/spreadsheets/d/1u3KCN6QmROo4uwPyEd1xa4QD6rbZZqiIyO8Q9yNFq_M/edit?usp=sharing'), :as => :discordrosters
  get '/trancerosters', to: redirect('https://docs.google.com/spreadsheets/d/159P4gIkI3gfzGnmjrFPySIjk2QqUDKmg3d6chUHLStE/edit?usp=sharing'), :as => :trancerosters
  get '/wmsharmonyaurum', to: redirect('https://docs.google.com/spreadsheets/d/1btPcbSt7ZkSIr4n7MeUHhbTbiY6vu99773S_IcVsaKk/edit?usp=sharing'), :as => :wmsharmonyaurum
  get '/wmsharmonyindigo', to: redirect('https://docs.google.com/spreadsheets/d/1oLZzcTzej4rSW2uuJgXS1iSnrY1KNdWK34GnspDjmKE/edit?usp=sharing'), :as => :wmsharmonyindigo
  get '/wmsharmonyelimination', to: redirect('https://docs.google.com/spreadsheets/d/1Q9QjZ3TGS54ePoLn68iV2AVyvpH9uTZZ4DaaNFQYLXc/edit?usp=sharing'), :as => :wmsharmonyelimination
  get '/wmsdiscordaurum', to: redirect('https://docs.google.com/spreadsheets/d/1NVOyhsHBsX-drHD9nMdufKKlFTSZw91fFTpkKpwfoXI/edit?usp=sharing'), :as => :wmsdiscordaurum
  get '/wmsdiscordindigo', to: redirect('https://docs.google.com/spreadsheets/d/1X1bXP87QMTJzA65D7XXib6eI4trtPQnNgsGDNzizK_0/edit?usp=sharing'), :as => :wmsdiscordindigo
  get '/wmsdiscordelimination', to: redirect('https://docs.google.com/spreadsheets/d/1PtgVkQzz5_e-BkfJRUClyhCFnB6S8CnTVBfVVEWR9D4/edit?usp=sharing'), :as => :wmsdiscordelimination
  get '/wmstranceaurum', to: redirect('https://docs.google.com/spreadsheets/d/1yVHVj35j5Sre9XFqCISSh_PK_5Kzf9oRiAhhA3up0bo/edit?usp=sharing'), :as => :wmstranceaurum
  get '/wmstranceindigo', to: redirect('https://docs.google.com/spreadsheets/d/1e3EN4nFV9kF1j8G9zFBkG3aELpuRgM2FQbQ8LKpzDCg/edit?usp=sharing'), :as => :wmstranceindigo
  get '/wmstranceelimination', to: redirect('https://docs.google.com/spreadsheets/d/1fXpsg3Ks6bYxZFeVS9nX9XonIeV3KkeirybwUnLn_bg/edit?usp=sharing'), :as => :wmstranceelimination
  get '/harmonyschedule', to: redirect('https://www.toornament.com/en_US/tournaments/4809730653463879680/matches/schedule'), :as => :harmonyschedule
  get '/discordschedule', to: redirect('https://www.toornament.com/en_US/tournaments/4809775329813782528/matches/schedule'), :as => :discordschedule
  get '/tranceschedule', to: redirect('https://www.toornament.com/en_US/tournaments/4809776538701357056/matches/schedule'), :as => :tranceschedule
end
