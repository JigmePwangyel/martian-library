module Mutations
  class SignInMutation < BaseMutation
    argument :email, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email:)
      user = User.find_by(email: email)
      return {} unless user

      token = Base64.encode64(user.email)
      {
        token: token,
        user: user
      }
    end
  end
end
