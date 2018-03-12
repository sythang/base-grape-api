class CreateApiTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :api_tokens do |t|
      t.string :token, uniq: true
      t.date :expired_at
      t.belongs_to :user, type: :uuid
      t.timestamps
    end
  end
end
