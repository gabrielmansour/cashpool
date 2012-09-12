module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition
  #
  def path_to(page_name)
    case page_name
      when "home"
        '/'
      else
        begin
          path_components = page_name.split(/\s+/)
          self.send(path_components.push('path').join('_'))
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
            "Now, go and add a mapping in #{__FILE__}"
        end
      end
  end
end

World(NavigationHelpers)

