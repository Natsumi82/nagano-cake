class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    acts_as_paranoid

  has_many :shipping_addresses, dependent: :destroy
  has_many :inside_carts, dependent: :destroy
  has_many :products, through: :inside_carts
  has_many :orders, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street_address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  validates :postal_code, format: { with: /\A\d{7}\z/ }

  def self.search(word)
    Client.where(["first_name LIKE? OR last_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%"])
  end
end