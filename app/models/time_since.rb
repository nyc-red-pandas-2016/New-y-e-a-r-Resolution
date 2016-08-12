module TimeSince

  def time_since_asked
    duration = Time.at(Time.now - self.created_at).utc.strftime("%H:%M:%S")
    hours = (duration.scan /^(.+?):/)[0][0].to_i
    if hours > 24
      return " Created #{hours / 24} day ago" if hours < 48
      return " Created #{hours / 24} days ago"
    elsif hours == 0
      minutes = duration[3..4].to_i
      if minutes == 0
        return " Created #{duration[7..8]} sec ago"
      else
        return " Created #{duration[3..4].to_i} min ago"
      end
    else
      return " Created #{hours} hours ago"
    end
  end

end
