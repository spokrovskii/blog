class AddRoleToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :role, :string, null: false, default: "member"
  end
end
