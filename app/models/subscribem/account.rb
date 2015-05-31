module Subscribem
  class Account < ActiveRecord::Base
    EXCLUDED_SUBDOMAIN = %w(admin)
    before_validation { self.subdomain == subdomain.to_s.downcase }

    validates :subdomain, presence: true,
      uniqueness: true,
      exclusion: { in: EXCLUDED_SUBDOMAIN, message: 'is not allowed, Please choose another subdomain.' },
      format: { with: /\A[\w\-]+\Z/i, message: 'is not allowed, Please choose another subdomain.' }

    belongs_to :owner, class_name: 'Subscribem::User'
    accepts_nested_attributes_for :owner
  end
end
