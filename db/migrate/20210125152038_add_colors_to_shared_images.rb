class AddColorsToSharedImages < ActiveRecord::Migration[6.0]
  def change
    add_column :shared_images, :colors, :json, null: false, default: '{}'
  end
end
