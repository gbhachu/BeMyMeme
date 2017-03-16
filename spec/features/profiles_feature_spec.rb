require 'rails_helper'

feature 'profiles' do
  context 'profile list page' do
      it 'should succesfully visit the profiles index' do
      visit '/'
      expect(page.status_code).to eq 200
    end
  end

  context 'index' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      fill_in('user_username', with: 'Leslie')
      fill_in('Dob', with: '24/01/1994')
      click_button('Sign up')
    end

    it 'should show a list of other user profiles' do
      visit '/'
      expect(page).to have_content 'test1'
      expect(page).to have_content 'male'
      expect(page).to have_content 'Kimberley'
    end

    it 'user should not be able to see their own profile' do
      visit '/'
      expect(page).to_not have_content 'Leslie'
    end
  end

  feature 'viewing user profiles' do
    context 'user signed in'  do
      before do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        fill_in('user_username', with: 'Leslie')
        fill_in('Dob', with: '24/01/1994')
        click_button('Sign up')
      end


      xit "should take user to own profile when they click link My Profile" do
        click_link('My profile')
        expect(page).to have_content('Leslie')
    end

      xit "should take user to a user profile when they click a user Profile" do
        visit '/profiles'
        click_link 'test1'
        expect(page).to have_content 'test1'
        expect(current_path).to eq "/profiles/#{test1.id}"
    end
  end

    context 'user not signed in' do
      xit "page should give options to Sign Up or Log in" do
        visit('/')
        expect(page).to have_content('Sign up')
        expect(page).to have_content('Log in')
      end
    end
  end
end
