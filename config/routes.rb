Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :testimonials do
    resources :testimonials, :path => '', :only => [:index, :show]
    post '/create' => "testimonials#create"
  end

  #get '/otzivy' => "testimonials#index"

  # Admin routes
  namespace :testimonials, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :testimonials do
        collection do
          post :update_positions
        end
      end
    end
  end

end
