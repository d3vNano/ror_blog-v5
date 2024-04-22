class AddAnonymousToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :anonymous, :boolean, default: true
  end
end
