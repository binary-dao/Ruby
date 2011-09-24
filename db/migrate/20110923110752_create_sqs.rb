class CreateSqs < ActiveRecord::Migration
  def change
    create_table :sqs do |t|
      t.integer :id
      t.string :looks
      t.integer :x
      t.integer :y
      t.integer :process_end

      t.timestamps
    end
  end
end
