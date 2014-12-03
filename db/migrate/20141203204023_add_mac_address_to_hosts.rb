class AddMacAddressToHosts < ActiveRecord::Migration
  def change
  add_column :hosts, :mc_address, :string
  end
end
