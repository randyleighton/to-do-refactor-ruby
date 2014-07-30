
require 'rspec'
require 'list'
require 'task'

describe List do
  it "starts out with an empty list of tasks" do
    test_list = List.new("School stuff")
    expect(test_list.tasks).to eq([])
  end

  it "can add tasks" do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby")
    test_list.add_task(test_task)
    expect(test_list.tasks).to eq [test_task]
  end

  it "can sort tasks by priority" do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby")
    another_test_task = Task.new("Learn Python")
    test_task.set_priority(2)
    another_test_task.set_priority(5)
    test_list.add_task(test_task)
    test_list.add_task(another_test_task)
    expect(test_list.tasks_by('p')).to eq [another_test_task, test_task]
  end

  it "can sort tasks by name" do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby")
    another_test_task = Task.new("Learn Python")
    test_list.add_task(test_task)
    test_list.add_task(another_test_task)
    expect(test_list.tasks_by('n')).to eq [another_test_task, test_task]
  end

  it "can sort tasks by date" do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby")
    another_test_task = Task.new("Learn Python")
    test_list.add_task(test_task)
    test_list.add_task(another_test_task)
    test_task.set_date("07/14/14")
    another_test_task.set_date("07/15/15")
    expect(test_list.tasks_by("d")).to eq [test_task, another_test_task]
  end
end

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('wash the car')
    expect(test_task).to be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task = Task.new('wash the car')
    expect(test_task.description).to eq 'wash the car'
  end
  it "can mark tasks complete" do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby")
    test_list.add_task(test_task)
    test_list.tasks[0].set_status("Complete")
    expect(test_list.tasks[0].status).to eq "Complete"
  end
end
