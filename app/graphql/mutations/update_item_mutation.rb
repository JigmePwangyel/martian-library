module Mutations
  class UpdateItemMutation < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :image_url, String, required: false

    field :item, Types::ItemType, null: true
    field :errors, [ String ], null: false

    def resolve(id:, title: nil, description: nil, image_url: nil)
      if context[:current_user].nil?
        raise GraphQL::ExecutionError, "Authentication required"
      end

      item = Item.find(id)

      if item.update(title: title, description: description, image_url: image_url)
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
