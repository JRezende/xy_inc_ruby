class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :nome
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
