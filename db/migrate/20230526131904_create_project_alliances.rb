# frozen_string_literal: true

class CreateProjectAlliances < ActiveRecord::Migration[7.0]
  def change
    create_table :project_alliances do |t|
      t.integer :project_id
      t.integer :team_id
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
