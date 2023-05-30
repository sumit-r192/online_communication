# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :timeline
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
