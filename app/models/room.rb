class Room < ApplicationRecord
  belongs_to :user
  has_many :bookings

  mount_uploaders :pictures, RoomUploader
  serialize :pictures, JSON
end
