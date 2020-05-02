class StaticPagesController < ApplicationController
  def home
    @products = [
    { id: 1, name: "Rubber Band Pack", price: "$3.50", description: "Rubber band ring, bracelet, choker and color of your choice", image: "rubber_band_pack.jpg", status: "In Stock" },
    { id: 2, name: "Slime Kits", price: "$6.50", description: "Kit that comes with everything you need to make slime", image: "slime_kits.jpg", status: "In Stock" },
    { id: 3, name: "Craft Kits", price: "$7.50", description: "Many types of craft kits for example: how to make a squishy and how to draw", image: "craft_kits.jpg", status: "In Stock" },
    { id: 4, name: "Sticker Pack", price: "$3.75", description: "Many types of stickers", image: "sticker_pack.jpg", status: "In Stock" },
    { id: 5, name: "Tissue Pack", price: "$5.30", description: "Comes in 5 tissues or more", image: "tissue_pack.jpg", status: "In Stock" }
    ]
  end

  def about
  end
end

