Rails.application.routes.draw do
  resources :artists do
    resources :songs
  end
  root 'charts#index'

  get 'new_chart_song/:id', to: 'charts#new_song', as: 'new_chart_song'
	post 'add_chart_song/:id/:song_id', to: 'charts#add_song', as: 'add_chart_song'
	get 'delete_chart_song/:id/:song_id', to: 'charts#delete_song', as: 'delete_chart_song'

  resources :charts
end
