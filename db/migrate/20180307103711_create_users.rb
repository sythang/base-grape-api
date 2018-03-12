class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :users, id: :uuid, default: 'gen_random_uuid()'  do |t|
      t.date :dob
      t.integer :gender
      t.string :username, unique: true
      t.timestamps
    end
  end
end
