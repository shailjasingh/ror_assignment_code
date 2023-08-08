class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :location
      t.string :state, default: "closed", null: false
      t.index [:name, :location], unique: true


      t.timestamps
    end
  end
end
