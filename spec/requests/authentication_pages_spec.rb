require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin pages" do
    before { visit signin_path }

    it { should have_selector("h1",    text: "Sign in") }
    it { should have_selector("title", text: "Sign in") }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector("title", text: "Sign in") }
      it { should have_selector("div.flash.error", text: "Invalid") }

      it { should_not have_link("Users") }
      it { should_not have_link("Profile") }
      it { should_not have_link("Settings") }
      it { should_not have_link("Sign out") }

      it { should have_link("Sign in", href: signin_path) }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector("div.flash.error", text: "Invalid") }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }

      it { should have_selector("title", text: user.name) }

      it { should have_link("Users",    href: users_path) }
      it { should have_link("Profile",  href: user_path(user)) }
      it { should have_link("Settings", href: edit_user_path(user)) }
      it { should have_link("Sign out", href: signout_path) }

      it { should_not have_link("Sign in", href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link("Sign in") }
      end
    end
  end

  describe "authorization" do

    let(:user) { FactoryGirl.create(:user) }

    describe "in the Users controllers" do

      describe "visiting the edit page" do
        before { visit edit_user_path(user) }
        it { should have_selector("title", text: "Sign in") }
      end

      describe "submitting to the update action" do
        before { put user_path(user) }
        specify { response.should redirect_to(signin_path) }
      end
    end

    describe "as wrong user" do
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should have_selector("title", text: "Sample App") }
      end
    end

    describe "for non-signed-in users" do

      describe "visiting the following page" do
        before { visit following_user_path(user) }
        it { should have_selector("title", text: "Sign in") }
      end

      describe "visiting the followers page" do
        before { visit followers_user_path(user) }
        it { should have_selector("title", text: "Sign in") }
      end

      describe "visiting the user index" do
        before { visit users_path }
        it { should have_selector("title", text: "Sign in") }
      end

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector("title", text: "Edit user")
          end

          describe "when signing in again" do
            before do
              visit signin_path
              fill_in "Email",    with: user.email
              fill_in "Password", with: user.password
              click_button "Sign in"
            end

            it "should render the default (profile) page" do
              page.should have_selector("title", text: user.name)
            end
          end
        end
      end
    end
  end
end
