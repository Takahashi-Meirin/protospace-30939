class Prototype < ApplicationRecord
  # usersテーブルとのアソシエーション
  belongs_to :user

  # imageカラムとのアソシエーションを記述。prototypeテーブルの各レコードとimageファイルを1対1の関係で紐づける。
  has_one_attached :image

  # プロトタイプの名称、キャッチコピー、コンセプト、画像に関するバリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  # 　commentテーブルとのアソシエーション
  has_many :comments, dependent: :destroy
end
