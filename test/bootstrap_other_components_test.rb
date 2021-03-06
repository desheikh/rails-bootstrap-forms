require 'test_helper'

class BootstrapOtherComponentsTest < ActionView::TestCase
  include BootstrapForm::Helper

  def setup
    setup_test_fixture
  end

  test "static control" do
    output = @horizontal_builder.static_control :email

    expected = %{<div class="form-group row"><label class="form-control-label col-sm-2 required" for="user_email">Email</label><div class="col-sm-10"><p class="form-control-static">steve@example.com</p></div></div>}
    assert_equal expected, output
  end

  test "static control doesn't require an actual attribute" do
    output = @horizontal_builder.static_control nil, label: "My Label" do
      "this is a test"
    end

    expected = %{<div class="form-group row"><label class="form-control-label col-sm-2" for="user_">My Label</label><div class="col-sm-10"><p class="form-control-static">this is a test</p></div></div>}
    assert_equal expected, output
  end

  test "static control doesn't require a name" do
    output = @horizontal_builder.static_control label: "Custom Label" do
      "Custom Control"
    end

    expected = %{<div class="form-group row"><label class="form-control-label col-sm-2" for="user_">Custom Label</label><div class="col-sm-10"><p class="form-control-static">Custom Control</p></div></div>}
    assert_equal expected, output
  end

  test "submit button defaults to rails action name" do
    expected = %{<input class="btn btn-secondary" name="commit" type="submit" value="Create User" />}
    assert_equal expected, @builder.submit
  end

  test "submit button uses default button classes" do
    expected = %{<input class="btn btn-secondary" name="commit" type="submit" value="Submit Form" />}
    assert_equal expected, @builder.submit("Submit Form")
  end

  test "override submit button classes" do
    expected = %{<input class="btn btn-primary" name="commit" type="submit" value="Submit Form" />}
    assert_equal expected, @builder.submit("Submit Form", class: "btn btn-primary")
  end

  test "primary button uses proper css classes" do
    expected = %{<input class="btn btn-primary" name="commit" type="submit" value="Submit Form" />}
    assert_equal expected, @builder.primary("Submit Form")
  end

  test "override primary button classes" do
    expected = %{<input class="btn btn-primary disabled" name="commit" type="submit" value="Submit Form" />}
    assert_equal expected, @builder.primary("Submit Form", class: "btn btn-primary disabled")
  end
end
