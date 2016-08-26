# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  license     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :areas, dependent: :destroy
end
