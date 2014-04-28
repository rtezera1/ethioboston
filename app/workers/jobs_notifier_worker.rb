class JobsNotifierWorker
  include Sidekiq::Worker


  def perform(job_id)
    CallList.find_each do |user|
      if user.reason == 'Jobs' || user.reason == 'Both'
        @job = Job.find(job_id)
        message = Message.new
        message.send_text( user.phone_number, "New Job Added: #{@job.job_title}-#{@job.name}-#{@job.contact_phone_number}")
      end
    end

      Notification.new_job(@job).deliver

  end
end
