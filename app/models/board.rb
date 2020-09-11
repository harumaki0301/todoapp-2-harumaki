class Board < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
