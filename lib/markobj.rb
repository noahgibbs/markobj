require "yaml"

class MarkObj
  attr_reader :name

  def initialize(name)
    @@names ||= {}
    raise "Name '#{name}' is already taken!" if @@names[name]
    @@names[name] = self
    @name = name
  end

  def load_yaml(string)
    @contents = YAML::load(string)
  end

  def dump_yaml
    YAML::dump(@contents)
  end

  def add_dimension(name, values)
    @contents ||= {}
    @contents[name.to_sym] = normalize_dimension_array(values)
  end

  def generate
    @contents
  end

  private

  def normalize_dimension_value(v)
    case v
    when Symbol, String
      { :name => v.to_sym, :odds => 1.0 }
    when Hash
      raise "Can't get name!" unless v[:name]
      { :name => v[:name], :odds => v[:odds] || 1.0 }
    when MarkObj
      { :name => v.name, :odds => 1.0 }
    when Array
      if v[0].kind_of?(Numeric)
        v[0], v[1] = v[1], v[0]
      end
      { :name => v[0].to_sym, :odds => v[1] }
    else
      raise "Can't normalize value #{v.inspect}!"
    end
  end

  def normalize_dimension_array(values)
    values.map {|v| normalize_dimension_value(v) }
  end

  def normalize_dimension_hash(value)
  end

end
