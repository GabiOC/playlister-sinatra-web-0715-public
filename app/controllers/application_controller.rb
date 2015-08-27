class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  register Sinatra::Flash
  helpers do
    def link_for(object)
      resource_url = "/" + object.class.name.downcase + "s"
      slug = object.slug
      name = object.name
      %{<a href="#{resource_url}/#{slug}">#{name}</a>}
    end
  end

  get '/' do
    erb :index
  end
end
