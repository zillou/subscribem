require 'rails_helper'

describe Subscribem::Account do
  describe "associations" do
    it { should belong_to(:owner) }
  end

  describe "validations" do
    it { should validate_presence_of :subdomain }
    it { should validate_uniqueness_of :subdomain }
  end
end
