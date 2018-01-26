FactoryBot.define do
  factory :user do
    name "John"
    email { "#{name}@example.com" }
    last_signed_in { 10.days.ago }
    password "password"
    github_username { "#{name}-github" }
  end
end
