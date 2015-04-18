class Chirp < ActiveRecord::Base
    belongs_to(:users)
    def to_s
      self.to_s "chirps are info text"
    end
end
