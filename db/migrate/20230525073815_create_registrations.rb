class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.integer :id_user
      t.integer :id_event

      t.timestamps
    end
    add_index :registrations, :id_user
    add_index :registrations, :id_event
  end
end
