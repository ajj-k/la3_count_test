class Count2Create < ActiveRecord::Migration[6.1]
  def change
        create_table :count2s do |t|
      t.integer :number
      t.timestamps null: false
    end
  end
end
