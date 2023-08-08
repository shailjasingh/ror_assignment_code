class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender, :limit => 1
      t.string :dob

      t.timestamps
    end
  end
end
