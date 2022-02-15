class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.integer :hours
      t.text :learn
      t.text :health
      t.integer :user_id

      t.timestamps
    end
  end
end
