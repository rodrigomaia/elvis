helpers do
  def invoke_route(model, action, params=[])
    begin        
      clazz = Object.const_get model.capitalize

      puts "#{model}.invoke(#{action})"  
      clazz.new.send(action.to_sym)
    rescue Exception=>e
      "This error was happen - #{e.message}"
    end
  end
end

not_found do
  'This route does not exists!'
end