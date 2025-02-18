class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :category
      t.integer :due_interval
      t.date :due_date
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
