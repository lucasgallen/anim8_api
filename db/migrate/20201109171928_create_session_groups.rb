class CreateSessionGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :session_groups do |t|
      t.boolean :image_ready, null: false, default: true
      t.string  :slug,        index: { unique: true }

      t.timestamps
    end
  end
end
