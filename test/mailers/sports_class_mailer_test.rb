require 'test_helper'

class SportsClassMailerTest < ActionMailer::TestCase
  test "new_class_confirmation" do
    mail = SportsClassMailer.new_class_confirmation
    assert_equal "New class confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
