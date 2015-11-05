class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :content

      add_foreign_key :user.id

      t.timestamps
    end
  end
end
