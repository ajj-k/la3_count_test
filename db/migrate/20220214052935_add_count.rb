class AddCount < ActiveRecord::Migration[6.1]
  def change
    add_column :counts, :number2, :integer, default: 0
  end
end
