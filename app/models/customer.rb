class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :shipping_addresses
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :products
  
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true
  validates :personal_name, presence: true
  validates :family_name_kana, presence: true
  validates :personal_name_kana, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

end
