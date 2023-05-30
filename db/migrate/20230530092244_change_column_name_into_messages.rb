# frozen_string_literal: true

class ChangeColumnNameIntoMessages < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :project_alliance_id, :room_id
  end
end
