module ApplicationHelper

  def flash_class(level)
    style = case level.to_sym
      when :notice then "alert-info"
      when :success then "alert-success"
      when :alert then "alert-danger"
    end
    "alert alert-dismissable " << style
  end

end
