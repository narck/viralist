FactoryGirl.define do
  factory :user do
    username "asd"
    realname "Huugdem"
    email "test@hooks.com"
    password "Toplel123"
    password_confirmation "Toplel123"
  end

  factory :company do
  	name "Best LLC"
  end

  factory :visit do 
  	user :user

  end

  factory :store do 
  	name "Kauppa"
  	city "Helsinki"
  	address "Katu 1"
  	zip "01242"

  end

end