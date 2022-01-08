class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :email, presence: true
  #validates :encrypted_password, presence: true
  validates :nickname, presence: true
  validates :real_name_two_byte_s, presence: true
  validates :real_name_two_byte_p, presence: true
  validates :real_name_kana_s, presence: true
  validates :real_name_kana_p, presence: true
  validates :birthday, presence: true
end