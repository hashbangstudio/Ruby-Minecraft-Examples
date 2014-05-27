def flatten_parameters_to_string(l)
    if l.respond_to? :each
        val =  l.flatten.join(",")
    end
    #puts "val", val
    return val
end
