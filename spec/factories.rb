FactoryGirl.define do
  factory :user do
    username "asd"
    realname "Huugdem"
    email "test@hooks.com"
    password "Toplel123"
    password_confirmation "Toplel123"
  end

  factory :company do
  	id "1"
  	name "Best LLC"
  end

  factory :visit do 
  	user :user
  end
  
end