require 'rails_helper'

describe "Notifications", :js do
  let(:sender)    { create :member                        }
  let(:recipient) { create :member, login_name: 'beyonce' }

  before do
    sender.send_message(recipient, "this is the body", "something i want to say")
    login_as recipient
  end

  describe "Read conversations list" do
    before do
      visit root_path
      click_link 'Your Stuff'
      click_link 'Inbox'
    end
    it { expect(page).to have_content 'something i want to say' }
    it { Percy.snapshot(page, name: 'conversations#index') }

    describe 'deleting' do
    end
  end
end
