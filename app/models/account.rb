class Account < ActiveRecord::Base
  validates :subdomain, :name, presence: true
  validates :subdomain, uniqueness: true,
            format: { with: /\A[a-z][a-z0-9\-]+[a-z0-9]\Z/ }

end
