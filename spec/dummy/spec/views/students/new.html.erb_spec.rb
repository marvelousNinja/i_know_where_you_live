require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :name => "MyString",
      :surname => "MyString",
      :age => 1
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "input#student_name[name=?]", "student[name]"
      assert_select "input#student_surname[name=?]", "student[surname]"
      assert_select "input#student_age[name=?]", "student[age]"
    end
  end
end
