# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    number_of_items "MyString"
    integer "MyString"
  end
end
