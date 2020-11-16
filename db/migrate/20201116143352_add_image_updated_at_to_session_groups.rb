class AddImageUpdatedAtToSessionGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :session_groups, :image_updated_at, :datetime, null: false, default: DateTime.now
  end
end
