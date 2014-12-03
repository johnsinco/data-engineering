class Upload
  include ActiveModel::Model

  attr_accessor :file
  attr_accessor :filename
  attr_accessor :gross

  def save
    self.filename = file.original_filename
    tmp = file.open
    self.gross = tmp.readlines.drop(1).reduce(0) do |sum, line|
      fields = /\A([^\t]*)\t([^\t]*)\t([^\t]*)\t([^\t]*)\t([^\t]*)\t(.*)/.match(line)
      sum + create_purchase(fields)
    end 
  end

  private
  def create_purchase(fields)
    # find or create item & merchant
    merch = Merchant.find_or_create_by(name: fields[6], address: fields[5])
    item = merch.items.find_or_create_by(description: fields[2], price: fields[3])
    # create purchase 
    purchase = Purchase.new(purchaser: fields[1], quantity: fields[4], item: item)
    purchase.save
    # return the gross of the sale
    purchase.quantity * purchase.item.price
  end
end