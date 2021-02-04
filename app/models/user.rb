class User < ActiveRecord::Base
    has_many :vaccines
    
    has_secure_password

    validates :username, presence: true, uniqueness: true

    def self.find_by_id(query)
        self.find(query)
    end
end
