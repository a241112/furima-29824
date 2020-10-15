FactoryBot.define do
  factory :order do
    post_code { "123-1234" }
    prefecture_id { 1 }
    city { "福岡市" }
    house_number { "1-1-1" }
    building_name { "博多ビル" }
    phone_number { "09011112222" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
