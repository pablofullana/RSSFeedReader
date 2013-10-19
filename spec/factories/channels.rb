# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :channel do
    url "http://appleinsider.com.feedsportal.com/c/33975/f/616168/index.rss"
    name "AppleTest"
    user
  end
end


