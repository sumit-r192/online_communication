# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :broadcast_channel
      t.integer :project_alliance_id
      t.timestamps
    end
  end
end
