module Attributes
  class ItemAttribute < Types::BaseInputObject
    description "Attributes for creating or updating an Item"

    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_url, String, required: false
  end
end
