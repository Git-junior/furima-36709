FactoryBot.define do
  factory :order_address do
    post_code        {'123-4567'}
    prefecture_id    {'2'}
    municipalities   {'横浜市緑区'}
    address          {'青山1-1-1'}
    building_name    {'柳ビル103'}
    telephone_number {'09012345678'}
  end
end
