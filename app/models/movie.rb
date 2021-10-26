class Movie < ApplicationRecord
    validates :title, :image, presence: true
end
