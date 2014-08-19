def flatten_parameters_to_string(l)
    #flatten is recursive in ruby
    if l.respond_to? :each
        val =  l.flatten.join(",")
        return val
    else
       return l;
    end
end

