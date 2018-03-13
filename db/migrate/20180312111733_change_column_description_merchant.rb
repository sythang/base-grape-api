class ChangeColumnDescriptionMerchant < ActiveRecord::Migration[5.1]
  def change
    change_column :merchants, :description, :text
  end
end
