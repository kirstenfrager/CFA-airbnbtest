require 'rails_helper'

RSpec.describe "rooms/show", type: :view do

  it "view shows correct content" do

    user = User.create(:email => "me@cf.com")
    room = Room.create(:user => user, :title => "my airbnb house")
    room.pictures = [
      file_fixture("myroom.jpg").open
    ]
    room.save!

    assign(:room, room)
    render
    expect(rendered).to include(room.title)
  end

end
