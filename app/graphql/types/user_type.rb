module Types
  class UserType<Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false

    def name
      "#{object.first_name} #{object.last_name}"
    end
  end
end
