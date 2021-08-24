child = Child();

if isa(child, 'handle')
    disp('Child is a handle class.');
end

%% Ensure handle classes work as expceted
CM = ChildModifier(child);

disp(child.base_prop);
CM.modify();
disp(child.base_prop);
child.increment();
disp(child.base_prop);
CM.modify();
disp(child.base_prop);
child.increment();
disp(child.base_prop);