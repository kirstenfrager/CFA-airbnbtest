require 'rails_helper'

RSpec.describe Room, type: :model do

  it "room can save an image" do
    user = User.create(:email => "me@cf.com")
    room = Room.create(:user => user, :title => "my airbnb house")
    room.pictures = [
      file_fixture("myroom.jpg").open
    ]
    room.save!

    expect(room.pictures.count).to eq(1)
  end

  it "room require a title" do
  	room = Room.create(:title => nil)
	expect(room).to_not be_valid
  end

  it "room require a title of at least 2 characters" do
  	room = Room.create(:title => "a")
	expect(room).to_not be_valid
  end

  it "room require a title of atleast 2 characters" do
    user = User.create(:email => "test@test.com", :password => "12345678")
    room = build(:room, :user => user)
# require 'pry'; binding.pry
  	# room = Room.create(:title => "ab", :user => user, :description => "room")
	expect(room).to be_valid
  end
end
