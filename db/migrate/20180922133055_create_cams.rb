class CreateCams < ActiveRecord::Migration[5.2]
  def change
    create_table :cams do |t|
      t.string :name
      t.integer :last_shown
    end
  end
end
