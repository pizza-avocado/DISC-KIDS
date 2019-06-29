class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, 		  dependent: :destroy
  has_many :address_names,  dependent: :destroy
  has_many :carts, 		    	dependent: :destroy
  has_many :orders, 		    dependent: :destroy
  has_many :reviews, 		    dependent: :destroy
  has_many :likes, 			    dependent: :destroy

  validates :lastname,       presence: true
  validates :firstname,      presence: true
  validates :lastname_kana,  presence: true
  validates :firstname_kana, presence: true
  validates :postalcode,     presence: true
  validates :address,        presence: true
  validates :phonenumber,    presence: true
  validates :email,          presence: true, uniqueness: true

  default_scope -> { order(lastname_kana: :desc) }

  acts_as_paranoid

  def self.search(search)
    unless search
      return User.all
    else
      return User.where(['lastname LIKE ? OR firstname LIKE ? OR lastname_kana LIKE ? OR firstname_kana LIKE ? OR phonenumber LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
end
