FactoryBot.define do
  factory :item do
    name                {"hogehoge"}
    description         {"test@est"}
    category_id         {2}
    product_details_id  {2}
    delivery_fee_id     {2}
    shipping_area_id    {2}
    shipping_days_id    {2}
    price               {1000}
    association :user
  
  after(:build) do |item|
    item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
  end
end
end