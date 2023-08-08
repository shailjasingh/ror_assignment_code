class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.belongs_to :participant, null: false
      t.belongs_to :coordinator, null: false
      t.datetime :date_of_enrollment
      t.string :remarks
      t.string :contact_mode

      t.timestamps
    end
  end
end
