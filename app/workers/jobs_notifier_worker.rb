class JobsNotifierWorker
  include Sidekiq::Worker


  def perform(job_id)
    CallList.find_each do |user|
      if user.reason == 'Jobs' || user.reason == 'Both'
        job = Job.find(job_id)
        Notification.new_job
        message = Message.new
        message.send_text( user.phone_number, job.job_title )
      end
    end
  end
end