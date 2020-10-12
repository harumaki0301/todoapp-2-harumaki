class ChangeColumnToComments < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :board_id, :bigint, null: true
  end
end
