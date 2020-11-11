class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token, index: { unique: true }

      t.timestamps
    end
  end
end
