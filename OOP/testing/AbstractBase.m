classdef AbstractBase < handle
    
    properties
        base_prop;
    end
    
    methods (Abstract)
        printSomething(this)
    end
    
end

