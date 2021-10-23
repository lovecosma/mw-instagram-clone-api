class User < ApplicationRecord
    validates :username, :unique => true, :presence => true
    has_secure_password
end
