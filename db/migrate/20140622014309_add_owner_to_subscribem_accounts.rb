class AddOwnerToSubscribemAccounts < ActiveRecord::Migration
  def change
    add_reference :subscribem_accounts, :owner, index: true
  end
end
