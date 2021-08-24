classdef ChildModifier
    %CHILDMODIFIER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Child
    end
    
    methods
        function this = ChildModifier(Child)
            this.Child = Child;
        end
        
        function modify(this)
            this.Child.base_prop = this.Child.base_prop + 1;
        end
    end
    
end

