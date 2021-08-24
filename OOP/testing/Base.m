classdef Base < handle
    
    properties
        base_prop;
    end
    
    methods
        function this = Base()
            this.base_prop = 0;
        end
        
        function printSomething(this)
            disp('Base Class')
        end
    end
    
end

