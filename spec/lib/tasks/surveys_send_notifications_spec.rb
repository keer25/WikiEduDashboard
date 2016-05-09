require 'rails_helper'
# https://robots.thoughtbot.com/test-rake-tasks-like-a-boss


describe 'surveys:send_notifications' do
  include_context "rake"
  let!(:survey_notification) { create(:survey_notification) }

  it 'calls send_follow_ups on the active survey notififications' do
    expect_any_instance_of(SurveyNotification).to receive(:send_email)
    rake['surveys:send_notifications'].invoke
  end
end