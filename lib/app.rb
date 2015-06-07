class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  
  get "/" do
    "hello"
  end
  get "/issues" do
    per_page = 10
    current_page = params[:page].nil? ? 1 : params[:page].to_i
    @issues = Issue.limit(per_page).skip((current_page - 1) * per_page).all
    last_page = Issue.count / per_page
    last_page = last_page.succ if Issue.count % per_page
    @pagination = OpenStruct.new({
        last_page: last_page,
        current_page: current_page
    })
    haml :"issues/index"
  end
  get "/issues/new" do
    @issue = Issue.new
    haml :"issues/new"
  end
  post "/issues" do
    @issue = Issue.new params[:issue]
    if @issue.save
      redirect "/issues"
    else
      haml :"issues/new"
    end
  end
  
  get "/issues/:id/edit" do
    @issue = Issue.find params[:id]
    haml :"issues/edit"
  end
  
  put "/issues/:id" do
    @issue = Issue.find params[:id]
    if @issue.update_attributes params[:issue]
      redirect "/issues"
    else
      haml :"issues/edit"
    end
  end
end