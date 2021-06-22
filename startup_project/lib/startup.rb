require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end
    
    def employees
        @employees
    end

    def valid_title?(title)
        if salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(startup)
        if self.funding > startup.funding
            return true
        else 
            return false
        end
    end

    def hire(name, title)
        if !salaries.has_key?(title)
            raise
        else
            x = Employee.new(name, title)
            @employees << x
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @salaries[employee.title] < @funding
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise
        end
    end

    def payday
        @employees.each{|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        return sum/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        startup.employees.each do |employee|
            @employees << employee
        end
        startup.close
    end

end
