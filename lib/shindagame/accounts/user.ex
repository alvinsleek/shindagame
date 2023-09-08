defmodule Shindagame.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  # import Guardian.DBHelpers, only: [resource: 2]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email_address, :string
    field :msisdn, :string
    field :password_hash, :string
    field :role, :string, default: "Frontend Access"

    timestamps()
  end

  @required_fields ~w(first_name last_name email_address password_hash)
  @optional_fields ~w(msisdn role)

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email_address, :msisdn, :password_hash, :role])
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
    # |> changeset_with_role(attrs)
  end

  # defp changeset_with_role(changeset, attrs) do
  #   case Map.get(attrs, :role) do
  #     nil -> changeset
  #     role ->
  #       changeset
  #       |> put_change(:role, role)
  #   end
  # end

# userlogin
#   {:ok, user} = Shindagame.Accounts.User.authenticate(email_address, password)
# token = ShindagameWeb.Guardian.encode_and_sign(user)




  defp generate_token(user) do
    claims = %{"role" => user.role}
    Guardian.encode_and_sign(user, :token, claims: claims)
  end

  defp verify_token(token) do
    Guardian.decode_and_verify(token, :token)
  end

  defp register_user(attrs) do
    # %User{}
    # |> User.changeset(attrs)
    # |> Repo.insert()

    user_params = %{first_name: "John", last_name: "Doe", email: "john@example.com", password: "password", role: Gamewin.Accounts.Role.frontend_access()}
    {:ok, user} = Gamewin.Accounts.User.create_user(user_params)

  end

  defp login_user(email, password) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "User not found"}
      user ->
        case Comeonin.Bcrypt.checkpw(password, user.password_hash) do
          {:ok, _} -> {:ok, user, generate_token(user)}
          _ -> {:error, "Invalid password"}
        end
    end
  end


end
