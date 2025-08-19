// ProductPage.ets
// Translated from Swift ViewController.swift
// Copyright © 2016 Code School. All rights reserved.

// ArkTS imports for UI components
import { Product } from '../model/Product'; // Import Product model

@Entry
@Component
struct ProductViewController {
  // State variable for product data (nullable)
  @State product: Product | null = null;

  // Build UI declaratively
  build() {
    Column() {
      // Product image view - conditionally rendered
      if (this.product && this.product.fullscreenImageName) {
        // Use media resources with original asset names
        Image($r('app.media.' + this.product.fullscreenImageName))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .height(300)
          .margin({ bottom: 20 })
          .id('productImageView')
      }

      // Product name label
      if (this.product) {
        Text(this.product.name || '' )
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .margin({ bottom: 20 })
          .id('productNameLabel')
      }

      // Add to cart button with styled image
      Button() {
        Image($r('app.media.button_addtocart'))
          .width(200)
          .height(50)
      }
      .onClick(() => {
        // Action handler - logs to console
        this.addToCartButtonDidTap();
      })
      .backgroundColor(Color.Transparent)
      .padding(16)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }

  // Button action handler (preserved method name)
  addToCartButtonDidTap(): void {
    console.log("Add to cart successfully");
  }
}