require 'rubygems'
require 'faker'
require 'mongoid'
Mongoid.load!("mongodb.yml", :development)

task :fakedata, :environment do
  
  1000.times do
    puts Faker::Name.name
    issue = Issue.new
    issue.name = Faker::Name.name
    issue.description = Faker::Name.name
    issue.save!
  end
end