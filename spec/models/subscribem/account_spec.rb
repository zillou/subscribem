require 'rails_helper'

describe Subscribem::Account do
  describe "associations" do
    it { should belong_to(:owner) }
  end
end
