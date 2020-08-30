FactoryBot.define do
  factory :item do
    product_name     {'流れ星'}
    description      {'ペルセウス座流星群'}
    category_id      {'2'}
    status_id        {'2'}
    burden_id        {'2'}
    prefecture_id    {'2'}
    day_id           {'2'}
    price            {'300'}
  end
end
