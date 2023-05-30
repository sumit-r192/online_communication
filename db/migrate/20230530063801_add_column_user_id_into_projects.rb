# frozen_string_literal: true

class AddColumnUserIdIntoProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :user_id, :integer, null: false
  end
end
