FactoryGirl.define do
  factory :user do 
    name "Kappie"
    admin false
  end

  factory :topic do
    title "Hallo iedereen"
    body "Ik heb geen clue wat ik moet zeggen."
  end

  factory :reply do
    body "Je bent een droplul."
  end
end