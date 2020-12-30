class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      # プロトタイプの名称、キャッチコピー、コンセントのためのカラムの追加
      t.string :title
      t.text :catch_copy
      t.text :concept
      # userを参照するための外部キーを記述。外部キーがないとDBに保存できないようにする。
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
