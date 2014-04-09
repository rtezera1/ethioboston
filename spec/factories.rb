FactoryGirl.define do 

  factory :user do 
    sequence(:email) { |n| 'abc_#{n}@example.com'}
    password 'adminqwerty'
  end
end
