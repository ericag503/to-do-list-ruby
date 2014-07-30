class List
  def initialize (list_name)
  @list_name = list_name
  @tasks = []
  @completed = []
  end

  def list_name
    @list_name
  end

  def tasks
    @tasks
  end

  def add_task (task_description)
    @tasks << task_description
  end

end
