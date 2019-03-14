Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/rebels/register_rebels' => 'rebels#register_rebels'
      post '/rebels/register_rebels' => 'rebels#register_rebels'
    end
  end

end
