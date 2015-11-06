class CreateCheerups < ActiveRecord::Migration
  def change
    create_table :cheerups do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
