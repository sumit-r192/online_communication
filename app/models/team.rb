# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :project_alliances
  has_many :projects, through: :project_alliance
  has_and_belongs_to_many :users
end
