FactoryBot.define do
  factory :purchase_function do
      postal_code         {"123-4567"}
      shipping_area_id    {2}
      municipalities      {"渋谷区"}
      address             {"青山1-1-1"}
      building            {"東京タワー"}
      phone_number        {"09012345678"}
      token               {"token"}
  end
  end