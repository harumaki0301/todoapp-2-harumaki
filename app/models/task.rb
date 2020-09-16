# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text
#  deadline   :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#
class Task < ApplicationRecord
  belongs_to :board
  validates :title, :deadline, presence: true
end
