//  ProductsModel.ets
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.

export class Product {
  name: string;
  cellImageName: string | null;
  fullscreenImageName: string | null;

  constructor(name: string, cellImageName: string | null, fullscreenImageName: string | null) {
    this.name = name;
    this.cellImageName = cellImageName;
    this.fullscreenImageName = fullscreenImageName;
  }
}

export const products: Array<Product> = [
  new Product("1907 Wall Set", "image_cell1", "phone_fullscreen1"),
  new Product("1921 Dial Phone", "image_cell2", "phone_fullscreen2"),
  new Product("1937 Desk Set", "image_cell3", "phone_fullscreen3"),
  new Product("1984 Moto Portable", "image_cell4", "phone_fullscreen4")
];