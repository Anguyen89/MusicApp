class Album < ActiveRecord::Base
  validates :name, :band_id, :year, :live, presence: true

  validates :name, uniqueness: true
  validates :live, inclusion: { in: [true, false]}

  belongs_to :band

  has_many :tracks, dependent: :destroy
end
