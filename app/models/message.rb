class Message < ApplicationRecord
    validates :body, :presence => true
    validates :username, :presence => true
end
