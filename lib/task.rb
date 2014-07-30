class Task

  def initialize(description)
    @description = description
    @status = "Incomplete"
    @priority = 1

  end

  def description
    @description
  end

  def status
    @status
  end

  def set_status(status)
    @status = status
  end

  def set_priority(priority)
    @priority = priority
  end

  def priority
    @priority
  end

  def set_date(date)
    @date = date
  end

  def date
    @date
  end



end
