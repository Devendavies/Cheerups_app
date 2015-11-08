class CreateCheerups < ActiveRecord::Migration
  def change
    create_table :cheerups do |t|
      t.references :user, index: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
