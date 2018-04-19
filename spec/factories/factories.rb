FactoryBot.define do

  factory :example_user do
    name "John"
    email { "#{name}@example.com" }
    last_signed_in { 10.days.ago }
    password "password"
    github_username { "#{name}-github" }
  end

  factory :user do
    email "example@example.com" 
    password "password"
    password_confirmation "password"
  end

end
