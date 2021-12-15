module SharedMethods
    def create_notifications
      Notification.create(
          notify_type: self.class.to_s.downcase,
          actor: user,
          user: post.user,
          target: self
      )
    end
end