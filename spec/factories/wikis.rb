FactoryGirl.define do
  factory :wiki do
    title "New Wiki Title"
    body "New Wiki Body"
    private false
    user
  end
 end
