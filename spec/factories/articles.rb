# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    link "MyString"
    description "MyText"
    pub_date "2013-10-19"
    comments "MyText"
    starred false
    channel_id 1
  end
end
