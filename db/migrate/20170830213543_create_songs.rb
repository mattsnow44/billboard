class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :chart_no
      t.belongs_to :artist, foreign_key: true
      t.belongs_to :chart, foreign_key: true

      t.timestamps
    end
  end
end
