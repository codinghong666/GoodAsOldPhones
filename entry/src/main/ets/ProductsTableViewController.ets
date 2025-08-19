//  ProductsTableViewController.ets
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.

import router from '@ohos.router';
import type { BusinessError } from '@ohos.base';
import { Product, products } from './ProductsModel';

@Entry
@Component
struct ProductsTableViewController {
  private products: Array<Product> = products;
  private identifer: string = "productCell";

  build() {
    Column({ space: 0 }) {
      // MARK: - UITableViewDataSource
      List({ space: 0 }) {
        ForEach(this.products, (product: Product, index: number) => {
          ListItem() {
            Row() {
              // Render image if available
              if (product.cellImageName) {
                Image($r(`app.media.${product.cellImageName}`))
                  .width(50)
                  .height(50)
                  .margin(10)
              }
              Text(product.name)
                .fontSize(16)
                .margin({ right: 10 })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          // MARK: - View Transfer
          .onClick(() => {
            // Equivalent to prepareForSegue
            router.pushUrl({
              url: 'pages/ProductView',
              params: { productIndex: index }
            }).catch((err: BusinessError) => console.error("Navigation failed", err));
          })
        })
      }
      .width('100%')
      .layoutWeight(1) // Fill available space
    }
    .width('100%')
    .height('100%')
  }
}