class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.references :merchant, index: true
      t.string :address
      t.string :name
      t.timestamps
    end
  end
end