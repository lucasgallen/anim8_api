class SerializableSessionGroup < JSONAPI::Serializable::Resource
  id { @object.slug }

  type 'session_groups'
  attribute :image_ready
  has_one :shared_image do
    meta data_url: @object.shared_image.data_url,
         colors: @object.shared_image.colors
  end
end
