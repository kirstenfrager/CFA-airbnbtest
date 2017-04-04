class Room < ApplicationRecord
  belongs_to :user

  mount_uploaders :pictures, RoomUploader
  serialize :pictures, JSON
end
