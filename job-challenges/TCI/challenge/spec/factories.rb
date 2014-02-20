FactoryGirl.define do
  factory :programs do
    sequence(:title) {|n| "Test#{n}" }
    subtitle             "Challenge"
    code                 "ABC123"
  end
end