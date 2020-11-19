require'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
    def setup
        @admin = users(:gerardo)
        @non_admin = users(:archer)
    end
    
    test "index including pagination" do
        log_in_as(@admin)
        get users_path
        assert_template 'users/index'
        assert_select 'div.pagination'
        User.paginate(page:1).each do |user|
            assert_select'a[href=?]', user_path(user),text: user.name
        end
    end
end