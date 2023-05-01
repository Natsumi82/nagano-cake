class CreateInsideCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :inside_carts do |t|

      t.timestamps
    end
  end
end
