# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/tests', to: 'tests#index'
post '/words', to: 'words#create'
get '/words/new', to: 'words#new'
root to: 'words#index'
# get '/words', to: 'words#index'
