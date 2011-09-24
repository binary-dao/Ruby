class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :type
      t.integer :id
      t.integer :x
      t.integer :y
      t.integer :process_end

      t.timestamps
    end
  end
end
