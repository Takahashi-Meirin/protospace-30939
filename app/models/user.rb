class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーションの追加　データが空の場合にはDBに保存しない
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true

  # prototypesテーブルとのアソシエーション
  has_many :prototypes

  # commentテーブルとのアソシエーション
  has_many :comments
end
