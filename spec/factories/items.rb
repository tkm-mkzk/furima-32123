FactoryBot.define do
  factory :item do
    item_name          { 'スニーカー' }
    item_description   { '赤色、２７センチ' }
    category_id        { 2 }
    item_condition_id  { 2 }
    shipping_cost_id   { 2 }
    shipping_source_id { 2 }
    days_to_ship_id    { 2 }
    price              { 300 }
    association        :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
