classdef Array < handle
    properties(SetAccess = private)
        value
        elementType
        length
    end

    methods
        function this = Array(vector)
            if strcmp(class(vector), 'char') ||  isscalar(vector)
                error("You should input an vector exclude char vec to Array constructor");
            end

            this.value = vector;
            this.length = length(vector);
            this.elementType = class(vector);
        end
    end

    methods
        function value = get(this, index)
            value = this.value(index);
        end

        function res = isEmpty(this)
            if this.length == 0
                res = true
            else
                res = false
            end
        end
        
        function push(this, val)
            if ~strcmp(class(val), this.elementType)
                error("You should push an val of type " + this.elementType);
            end

            this.length = this.length + 1;
            this.value(this.length) = val;
        end
    end

    methods
        % callback(currentValue, index, thisArr)
        function forEach(this, callback)
            if this.isEmpty, return, end
            for i = 1:(this.length)
                callback(this.value(i), i, this);
            end
        end

        % callack(currentValue, index, thisArr)
        function newArr = filter(this, callback)
            if this.isEmpty
                newArr = Array([]);
                return
            end
            newArr = Array([]);
            if this.isEmpty, return, end
            for i = 1:(this.length)
                el = this.value(i);
                boolean = callback(el, i, this);
                if boolean
                    newArr.push(el);
                end
            end
        end

        % callback(accumulator, currentvalue, index, thisArr)
        function accumulator = reduce(this, callback, initialValue)
            if this.isEmpty
                if nargin < 3
                    error("Reduce of an empty array wit no initial value");
                else
                    accumulator = initialValue;
                    return
                end
            end

            if nargin < 3
                accumulator = this.value(1);
                startIndex = 2;
            else
                accumulator = initialValue;
                startIndex = 1;
            end

            for i = startIndex:(this.length)
                accumulator = callback(accumulator, this.value(i), i, this)
            end
        end

        function newArr = map(this, callback)
            if this.isEmpty
                newArr = Array([]);
                return
            end

            temp = zeros(1, this.length);
            for i = 1:(this.length)
                el = this.value(i);
               temp(i) = callback(el);
            end
            newArr = Array(temp);
        end
    end
end