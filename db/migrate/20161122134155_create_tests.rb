class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string  :subject
      t.integer :part

      t.timestamps null: false
    end
  end
end
