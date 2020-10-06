class AddBoardIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :board_id, :integer, null: false
  end
end
