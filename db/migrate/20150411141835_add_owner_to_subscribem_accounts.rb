class AddOwnerToSubscribemAccounts < ActiveRecord::Migration
  def change
    add_reference :subscribem_accounts, :owner, index: true, foreign_key: true
  end
end
