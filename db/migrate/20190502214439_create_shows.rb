class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.date :occurred_at

      t.timestamps
    end
  end
end
