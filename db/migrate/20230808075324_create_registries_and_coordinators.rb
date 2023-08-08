class CreateRegistriesAndCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinators_registries do |t|
      t.belongs_to :registry, null: false
      t.belongs_to :coordinator, null: false
    end

    add_foreign_key :coordinators_registries, :registries
    add_foreign_key :coordinators_registries, :coordinators
  end
end
