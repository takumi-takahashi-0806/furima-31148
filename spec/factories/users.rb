FactoryBot.define do
  factory :user do
    nickname              {"hogehoge"}
    email                 {"test@test"}
    password              {"111111a"}
    password_confirmation {"111111a"}
    first_name            {"山田"}
    last_name             {"太郎"}
    kanafirst_name        {"ヤマダ"}
    kanamiddle_name       {"タロウ"}
    birthday              {"1989-08-06"}
  end
end