# frozen_string_literal: true

class ProjectAlliance < ApplicationRecord
  belongs_to :project
  belongs_to :team
  has_many :messages

  enum status: %i[active hold terminated]
end
