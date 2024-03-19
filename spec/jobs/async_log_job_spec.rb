require 'rails_helper'

RSpec.describe AsyncLogJob, type: :job do
  describe "ジョブ追加テスト" do
    it "キューにジョブが追加されること" do
      ActiveJob::Base.queue_adapter = :test #テスト用のキューアダプターを利用
      expect {
        AsyncLogJob.perform_later(message: "from test")
      }.to have_enqueued_job(AsyncLogJob)
    end
  end
end
