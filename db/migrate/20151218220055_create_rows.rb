class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.references :user, index: true, foreign_key: true
      t.string :filename
      t.string :col1
      t.string :col2
      t.string :col3
      t.string :col4
      t.string :col5
      t.string :col6
      t.string :col7

      t.timestamps null: false
    end
  end
end
