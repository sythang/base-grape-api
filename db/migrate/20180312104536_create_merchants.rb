class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.attachment :logo
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
