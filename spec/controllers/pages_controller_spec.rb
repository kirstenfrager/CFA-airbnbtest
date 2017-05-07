require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "using fixtures" do

    #tell rails which fixtures you are about to use
    fixtures :users, :rooms, :bookings

    it "user is valid" do
      user = build(:user)

      #creates a matching function for us and we can now call peter record
      # user = users(:peter)
      # room = rooms(:sydney)
      # booking = bookings(:jamies_booking)
  # require 'pry'; binding.pry
    end
  end

  describe "GET #guest_dashboard" do
    # before :each do
    #   user = User.create(:email => "test@test.com")
    #   controller.sign_in user
    # end

    it "returns http success" do
      user = sign_in_valid_user
      room = Room.create()
  		user_booking = Booking.create(:user => user, :room => room)

  		other_user = User.create(:email => "notme@cf.com")
  		Booking.create(:user => other_user)

  		get :guest_dashboard
  		expect(response).to have_http_status(:success)

  		bookings = assigns(:bookings)
  #require 'pry'; binding.pry
  		expect(bookings).to match_array([user_booking])
  #check pending bookings are correct
#      expect(assigns(:pending_bookings)).to match_array([user_booking])
  #check approved bookings
#      expect(assigns(:approved_bookings)).to match_array([user_booking])
    end

    def sign_in_valid_user
      user = User.create(:email => "test@test.com")
      controller.sign_in user
      user
    end
  end

end
