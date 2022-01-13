FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    real_name_two_byte_s  {'山田'}
    real_name_two_byte_p  {'隆太郎'}
    real_name_kana_s      {'ヤマダ'}
    real_name_kana_p      {'リクタロウ'}
    birthday              {'1930-01-01'}
  end
end