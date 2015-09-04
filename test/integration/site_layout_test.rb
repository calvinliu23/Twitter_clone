require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

# bundle exec rake test:integration to run this test
	test "layout links" do
		#this test that it goes to root_path
		get root_path
		#this tests the template
		assert_template 'static_pages/home'
		# assert_select lets you select any htnl and test it
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", help_path
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", contact_path
	end
end
