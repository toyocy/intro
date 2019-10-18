class AddDefaultIsActiveToOrganization < ActiveRecord::Migration[5.2]
  def change
    change_column :organizations, :is_active, :boolean, default: true
  end
end
