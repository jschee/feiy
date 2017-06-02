class Organization < ApplicationRecord
  scope :accepted, -> { where(accepted?: true) }
  has_attachment :logo
  has_attachment :photo
  acts_as_commentable
  acts_as_votable
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :jobs, dependent: :destroy
  validates :user_is_a_representative, presence: true
  validates :category, presence: true, inclusion: { in: %w(Education Fashion Food Waste Health Environment Inclusion Community) }
end
