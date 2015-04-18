class User < ActiveRecord::Base
    has_many(:chirps)
    def to_s
      self.to_s "I got me some chirps yall"
    end
end
