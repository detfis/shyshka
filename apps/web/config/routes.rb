delete '/words/:id', to: 'words#destroy', as: :destroy_word
get '/words/:id/edit', to: 'words#edit', as: :edit_word
patch '/words/:id', to: 'words#update'
post '/words', to: 'words#create'
get '/words/new', to: 'words#new', as: :new_word
root to: 'words#index'
