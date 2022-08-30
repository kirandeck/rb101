def initialize_lights(n)
  lights = {}
  1.upto(n) do |index|
    lights[index] = 'off'
  end
  lights
end

def toggle_lights(lights, iteration)
  lights.map do |switch, status|
    if switch % iteration == 0 && status == 'off'
      lights[switch] = 'on'
    elsif switch % iteration == 0 && status == 'on'
      lights[switch] = 'off'
    end
  end
  lights
end

def on_lights(lights)
  lights.select { |_switch, status| status == 'on' }.keys
end

def iterate_through_lights(n)
  lights = initialize_lights(n)
  1.upto(n) do |iteration|
    lights = toggle_lights(lights, iteration)
  end
  on_lights(lights)
end

p iterate_through_lights(1000)
  

    
