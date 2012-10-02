# encoding: UTF-8
require 'test_helper'

class Html5StringInputTest < ActionView::TestCase
  [:html5_date, :html5_datetime, :html5_time].each do |type|
    html5_type = type.to_s.sub(/^html5_/, '')

    test "input should allow type #{type}" do
      with_input_for @user, :name, type
      assert_select "input[type=#{html5_type}]"
    end

    test "input should not allow type #{type} if HTML5 compatibility is disabled" do
      swap_wrapper do
        with_input_for @user, :name, type
        assert_select "input[type=text]"
        assert_no_select "input[type=#{html5_type}]"
      end
    end
  end
end
