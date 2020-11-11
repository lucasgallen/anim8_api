class CreateSharedImages < ActiveRecord::Migration[6.0]
  def change
    create_table :shared_images do |t|
      t.belongs_to :session_group
      t.string     :data_url

      t.timestamps
    end
  end
end
