module Subscribem
  class AccountsController < ApplicationController
    def new
      @account = Subscribem::Account.new
    end

    def create
      @account = Subscribem::Account.new(account_params)
      @account.save
      flash[:success] = "Your account has been successfully created."
      redirect_to subscribem.root_url
    end

    private

    def account_params
      params.require(:account).permit(:name)
    end
  end
end
