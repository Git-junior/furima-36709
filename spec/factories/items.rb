FactoryBot.define do
  factory :item do
    name               {'サイコロ'}
    text               {'JPEGサイコロ'}
    category_id        {'2'}
    situation_id       {'2'}
    delivery_charge_id {'2'}
    prefecture_id      {'2'}
    delivery_time_id   {'2'}
    price              {'1000'}
    association        :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
