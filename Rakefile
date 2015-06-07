require "rake/testtask"
require 'mongoid'

#Dir[Rails.root.join('app', 'models', '**/*')].each { |file| File.basename(file, '.rb').camelize.constantize }

Dir.glob('lib/tasks/*.rake').each { |r| load r}
Dir.glob('lib/models/*.rb').each { |r| load r}

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
  t.libs << "test"
end

task default: :test
