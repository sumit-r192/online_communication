# frozen_string_literal: true

class ProjectAlliance < ApplicationRecord
  belongs_to :project
  belongs_to :team
  has_one :room

  enum status: %i[active hold terminated]
end
