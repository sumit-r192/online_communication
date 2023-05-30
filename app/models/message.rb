# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :project_alliance
  belongs_to :user
end
