class CreateMessageships < ActiveRecord::Migration[7.0]
  def change
    create_table :messageships do |t|
      t.references :user,null:false, foreign_key: true
      t.references :friend, references: :users, foregn_key:{to_table: :users}
      t.timestamps
    end
  end
end
