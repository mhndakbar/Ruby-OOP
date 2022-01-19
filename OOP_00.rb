class Cargo
    def initialize(id, weight, shippingFees, price)
        @id = id
        @weight = weight
        @shippingFees = shippingFees
        @price = price
    end
    def getPrice
        @price + (@shippingFees * @weight)
    end
end

item = Cargo.new(1, 10, 5, 10)
item2 = Cargo.new(2, 20, 7, 12)

p item.getPrice
p item2.getPrice