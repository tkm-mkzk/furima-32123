FactoryBot.define do
  factory :order_address do
    token         { 'pk_test_aaaaaaaaaaaa111111111111' }
    postal_code   { '111-1111' }
    prefecture    { 2 }
    city          { '横浜市緑区' }
    addresses     { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number  { '09011111111' }
  end
end
