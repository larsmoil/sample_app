require 'spec_helper'

def full_title(page_title)
	base_title = "Ruby on Rails Tutorial Sample App"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def session_sign_in(user)
  # Sign in when not using Capybara as well.
  session[:remember_token] = user.remember_token
end

def session_sign_out
  # Sign in when not using Capybara as well.
  session.delete(:remember_token)
end
