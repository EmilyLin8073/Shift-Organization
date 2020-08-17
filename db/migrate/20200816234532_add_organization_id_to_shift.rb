class AddOrganizationIdToShift < ActiveRecord::Migration[6.0]
  def change
    add_column :shifts, :organization_id, :integer, null: false
  end
end
