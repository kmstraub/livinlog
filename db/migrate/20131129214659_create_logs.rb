class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :when
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :title
      t.text :description
      t.string :media_type
      t.string :category
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
