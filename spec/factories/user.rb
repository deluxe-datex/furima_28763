FactoryBot.define do
  factory :user do
    name                  { 'yamada' }
    email                 { 'aaa@gmail.com' }
    password              { 'aaa0000' }
    password_confirmation { 'aaa0000' }
    first_name            { '太郎' }
    family_name           { '山田' }
    first_name_kana       { 'タロウ' }
    family_name_kana      { 'ヤマダ' }
    birth_day { '2020/8/25' }
  end
end
