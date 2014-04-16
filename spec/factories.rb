FactoryGirl.define do 

  factory :user do 
    sequence(:email) { |n| 'abc_#{n}@example.com'}
    password 'adminqwerty'
  end

  factory :job do 
    name 'robel'
    email 'robel@yahoo.com'
    job_title 'engineer'
    location 'boston'
    description 'making stuff'
    contact_phone_number '6173333333'
  end
end
