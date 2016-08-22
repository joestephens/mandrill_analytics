class MandrillAnalytics < Sinatra::Base
  set :views, Proc.new { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, 'views/public') }
end
