class SerializableSharedImage < JSONAPI::Serializable::Resource
  type 'shared_image'

  attribute :data_url do
    @object.data_url
  end
  belongs_to :session_group
end
