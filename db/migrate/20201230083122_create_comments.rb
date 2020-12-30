class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      # テキストのためのカラムを追加した
      t.text :text
      # userを参照するための外部キーを記述。外部キーがないとDBに保存できないようにする。
      t.references :user, foreign_key: true
      t.references :prototype, foreign_key: true

      t.timestamps

      
    end
  end
end
