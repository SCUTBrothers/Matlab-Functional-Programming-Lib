
    vec = [1, 2, 3];
    arr = Array(vec);
    callback = @(currentValue, index, thisArr) currentValue < 3; 
    newArr = arr.filter(callback);

    disp(newArr.value); % [1, 2]

