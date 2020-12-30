class Comment < ApplicationRecord
  # userテーブル,prototypeテーブルに対するアソシエーション
  belongs_to :user
  belongs_to :prototype

  # textに関するバリデーション
  validates :text, presence: true
end
