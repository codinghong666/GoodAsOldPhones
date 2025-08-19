/*
 * Product.ets
 * GoodAsOldPhones
 *
 * Copyright © 2016 Code School. All rights reserved.
 */

export class Product {
  name: string | null = null;
  cellImageName: string | null = null;
  fullscreenImageName: string | null = null;

  constructor(name: string, cellImageName: string, fullscreenImageName: string) {
    this.name = name;
    this.cellImageName = cellImageName;
    this.fullscreenImageName = fullscreenImageName;
  }
}