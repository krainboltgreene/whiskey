module <%= values.name.camelize %>
  require_relative "<%= values.name %>/model"
  require_relative "<%= values.name %>/action"
  require_relative "<%= values.name %>/control"
end
