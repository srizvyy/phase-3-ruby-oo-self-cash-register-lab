require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction_amount

    @@number_of_registers = 0

    def self.all_registers
        @@number_of_registers
    end

    def initialize(discount=0)
        @discount = discount
        @total = 0 
        @items = []
        @@number_of_registers += 1
    end

    def add_item(item, price, quantity = 1)
        quantity.times {self.items << item}
        @total += price * quantity
        last_transaction_amount = price * quantity
    end

    def apply_discount
        if discount == 0 
            return "There is no discount to apply."
        else
            @total -= @total * (@discount / 100.to_f)
            return "After the discount, the total comes to $#{@total}"
        end
        
    end

    def void_last_transaction
        @total -= @last_transaction_amount
        @last_transaction_amount = 0
    end
end
