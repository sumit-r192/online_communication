# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[developer project_manager]
  enum designation: %i[backend frontend devops]

  has_and_belongs_to_many :teams
  has_many :messages

  def project_manager?
    role.eql?('project_manager')
  end
end
