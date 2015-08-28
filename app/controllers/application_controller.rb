class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  ## enable: sessions and Sinatra::Flash are required as part of the sinatra/flash gem, which
  ## lets you display a 'flash' message to users once
  enable :sessions
  register Sinatra::Flash

=begin
** helpers **
sinatra top-level helpers let you define helper methods for use in route handlers and templates. In this
case, we're using link_for in the templates and this allows us access to the method there.
=end
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
