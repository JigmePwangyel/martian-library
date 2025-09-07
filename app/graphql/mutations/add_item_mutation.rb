module Mutations
  class AddItemMutation < BaseMutation
    argument :attributes, Attributes::ItemAttribute, required: true

    field :item, Types::ItemType, null: true
    field :errors, [ String ], null: false

    def resolve(attributes:)
      if context[:current_user].nil?
        raise GraphQL::ExecutionError, "Authentication required"
      end

      item = Item.new(
        title: title,
        description: description,
        image_url: image_url,
        user: context[:current_user]
      )
      if item.save
        {
          item: item
        }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
