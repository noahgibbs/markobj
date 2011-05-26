require_relative "test_helper.rb"

class ObjectFormatTest < Scope::TestCase
  def assert_dimension(obj, name, values, yaml)
    obj.add_dimension(name, values)
    trimmed_lines = []
    obj.dump_yaml.each_line.with_object(trimmed_lines) {|line, sum|
      sum << line.rstrip
    }
    assert_equal yaml, trimmed_lines.join("\n") + "\n"
  end

  context "Creating a new blank MarkObj" do
    setup do
      @obj = MarkObj.new(:obj_name)
    end

    teardown do
      MarkObj.clear_names
    end

    should "add a dimension with a simple array value" do
      assert_dimension @obj, :dim1, [:val1, :val2, :val3], <<YAML
---
:dim1:
- :value: :val1
  :odds: 1.0
- :value: :val2
  :odds: 1.0
- :value: :val3
  :odds: 1.0
YAML
    end

    should "add a dimension with a hash value" do
      assert_dimension @obj, :dim1, [{:value => :val1, :odds => 1.0}], <<YAML
---
:dim1:
- :value: :val1
  :odds: 1.0
YAML
    end
  end
end
