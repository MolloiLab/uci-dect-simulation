classdef Child < Base
    
    properties
    end
    
    methods
        function printSomething(this)
            disp('Child Class')
        end
        
        function increment(this)
            this.base_prop = this.base_prop + 1;
        end
    end
    
end

