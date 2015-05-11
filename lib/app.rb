class App < Sinatra::Base
  get "/" do
    "hello"
  end
  get "/issues/" do
    @issues = Issue.all
    @issues
  end
end