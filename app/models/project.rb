# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_alliances
  has_many :teams, through: :project_alliance

  enum status: %i[ideate planning inprogress completed]
end
