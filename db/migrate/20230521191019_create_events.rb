class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :heure
      t.string :lieu

      t.timestamps
    end
  end
end
