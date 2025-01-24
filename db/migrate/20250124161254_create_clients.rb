class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :dob
      t.date :last_appointment
      t.date :next_appointment
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
