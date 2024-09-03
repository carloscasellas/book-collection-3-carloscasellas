class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.float :price
      t.datetime :publishedDate

      t.timestamps
    end
  end
end
